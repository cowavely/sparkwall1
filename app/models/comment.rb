class Comment < ActiveRecord::Base
	belongs_to :user, :project
end
