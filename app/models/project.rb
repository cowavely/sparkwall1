class Project < ActiveRecord::Base

	has_many :comments
	has_many :likes
	has_many :project_wishlists
	belongs_to :user
	belongs_to :grade_level
	
	acts_as_taggable
	acts_as_taggable_on :tags, :subjects

end
