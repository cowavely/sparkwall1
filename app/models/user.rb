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

    def added_project_to_wishlist?(project)
    	!!wishlist.projects.include?(project)
    end

	def add_to_wishlist(project)
    	wishlist.projects << project
    	wishlist.save
 	end

 	def remove_from_wishlist(project)
 		wishlist.projects.delete(project)
 		wishlist.save
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

    def is_owner?(project)
      project.user.id == self.id
    end
end
