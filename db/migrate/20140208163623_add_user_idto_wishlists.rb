class AddUserIdtoWishlists < ActiveRecord::Migration
	def change
	  add_column :wishlists, :user_id, :integer
	end
end
