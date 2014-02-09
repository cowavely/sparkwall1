class RemoveWishlistIdFromUsers < ActiveRecord::Migration
  def up
	remove_column :users, :wishlist_id
  end
end
