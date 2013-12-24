class Like < ActiveRecord::Base
	belongs_to :user, :project
end
