class ProjectWishlist < ActiveRecord::Base
	belongs_to :project, :wishlist
end
