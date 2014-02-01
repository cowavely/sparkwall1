class ProjectWishlist < ActiveRecord::Base
	belongs_to :project
	belongs_to :wishlist
end
