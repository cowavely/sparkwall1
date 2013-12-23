class CreateProjectWishlists < ActiveRecord::Migration
  def change
    create_table :project_wishlists do |t|
      t.integer :project_id
      t.integer :wishlist_id

      t.timestamps
    end
  end
end
