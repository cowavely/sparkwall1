class PassthroughController < ApplicationController
  def index
  end
end


class PassthroughController < ApplicationController
 	def index
    	path = case user_signed_in?
      		when true
        		main_index_path
      		when false #when not signed in
       		 	#main_welcome_path
            main_index_path
    	end
    	redirect_to path     
  	end
end