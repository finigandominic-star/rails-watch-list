# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "json"
require "rest-client"

puts "Cleaning database..."
Movie.destroy_all

(1..5).each do |page|
  puts "Importing movies from page #{page}..."

url = "https://tmdb.lewagon.com/movie/top_rated?page=#{page}"
response = RestClient.get(url)
data = JSON.parse(response)
# => repos is an `Array` of `Hashes`.
movies = data["results"]
movies.each do |movie_data|
  Movie.create!(
  title: movie_data["title"],
  overview: movie_data["overview"],
  poster_url: movie_data["poster_path"],
  rating: movie_data["vote_average"]
  )
end
end

puts "Created #{Movie.count} movies!"
