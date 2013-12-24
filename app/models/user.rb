class User < ActiveRecord::Base
	has_many :comments, :likes, :projects
	has_one :wishlist

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
