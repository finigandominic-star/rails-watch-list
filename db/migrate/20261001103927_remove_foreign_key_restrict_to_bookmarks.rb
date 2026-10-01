class RemoveForeignKeyRestrictToBookmarks < ActiveRecord::Migration[8.1]
  def change
    remove_foreign_key :bookmarks, :movies
  end
end
