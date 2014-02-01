class Wishlist < ActiveRecord::Base
	has_many :project_wishlists
	belongs_to :user
end
