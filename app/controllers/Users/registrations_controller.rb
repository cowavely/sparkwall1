class Users::RegistrationsController < Devise::RegistrationsController

	def resource_params
	  params.require(:user).permit(:username, :name, :email, :location, :password, :password_confirmation, :avatar)
	end

	def sign_up_params
		params.require(:user).permit(:username, :name, :email, :location, :password, :password_confirmation, :avatar)
	end

	def account_update_params
		params.require(:user).permit(:username, :name, :email, :location, :password, :password_confirmation, :avatar, :current_password)
	end

  def new
    build_resource({})
    respond_with self.resource
  end

  # def show
  #   @user = User.find(params[:id])
  # end

  def create
    build_resource(sign_up_params)
    resource.build_wishlist

    if resource.save
      yield resource if block_given?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end


  private :resource_params
  private :sign_up_params
  private :account_update_params

end