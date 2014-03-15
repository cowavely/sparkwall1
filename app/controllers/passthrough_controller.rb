class PassthroughController < ApplicationController
  def index
  end
end


class PassthroughController < ApplicationController
 	def index
    	path = case user_signed_in?
      		when true
        		root_path
      		when false #when not signed in
       		 	#main_welcome_path
            root_path
    	end
    	redirect_to path     
  	end
end