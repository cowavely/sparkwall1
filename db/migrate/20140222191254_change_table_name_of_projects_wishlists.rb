class ChangeTableNameOfProjectsWishlists < ActiveRecord::Migration
  def change
    rename_table :project_wishlists, :projects_wishlists
  end
end
