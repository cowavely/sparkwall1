class Project < ActiveRecord::Base
	has_many :comments, :project_wishlists, :likes
	belongs_to :user
end
