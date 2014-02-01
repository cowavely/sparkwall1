class Project < ActiveRecord::Base
	has_many :comments
	has_many :likes
	has_many :project_wishlists
	belongs_to :user
end
