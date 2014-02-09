class User < ActiveRecord::Base
	has_many :projects
	has_many :comments
	has_many :likes
	has_one :wishlist

	mount_uploader :avatar, AvatarUploader

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
