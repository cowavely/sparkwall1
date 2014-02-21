class Project < ActiveRecord::Base

	has_many :comments
	
	#has_many :likes
	has_many   :likes, :dependent => :destroy
    has_many   :liked_by, :through => :likes, :source => :user

	#has_many :project_wishlists
	#has_many :wishlists, :through => :project_wishlists
	has_and_belongs_to_many :wishlists

	belongs_to :user
	belongs_to :grade_level
	
	acts_as_taggable
	acts_as_taggable_on :tags, :subjects

end
