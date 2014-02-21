class Wishlist < ActiveRecord::Base
	belongs_to :user
	#has_many :project_wishlists
	#has_many :projects, :through => :project_wishlists
	has_and_belongs_to_many :projects
end
