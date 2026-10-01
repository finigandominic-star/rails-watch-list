class AddForeignKeyRestrictToBookmarks < ActiveRecord::Migration[8.1]
  def change
    add_foreign_key :bookmarks, :movies, on_delete: :restrict
  end
end
