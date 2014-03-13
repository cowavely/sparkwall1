class UsersController < ApplicationController
	def show
    	@user = User.find(params[:id])
    end

    def wishlist
    	@user = User.find(params[:id])
    end
    
    def likes
    	@user = User.find(params[:id])
    end
end
