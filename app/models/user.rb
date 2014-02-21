class User < ActiveRecord::Base

	has_many :projects, dependent: :destroy
	has_many :comments, dependent: :destroy
	#has_many :likes
	has_one :wishlist, dependent: :destroy

	has_many :likes, dependent: :destroy
    has_many :liked_projects, :through => :likes, :source => :project

	mount_uploader :avatar, AvatarUploader

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	def add_to_wishlist(project)
    	wishlist.projects << project
 	end

 	def likes_project?(project)
    	!!likes.find_by(user_id: self.id, project_id: project.id)
 	end

  	def like!(project)
    	likes.create!(project_id: project.id)
  	end

  	 def unlike!(project)
    	likes.find_by(project_id: project.id).destroy
  	end
end
