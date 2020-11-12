class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  def index
  end

  def new
    @user = User.new
  end
  def create
    User.create
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render_to
  end
  
  def edit
    
  end

  private
  def configure_permitted_parameters
      # if resource_class == User
            devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:family_name, :first_name, :family_name_kana, :first_name_kana, :birthday])
            devise_parameter_sanitizer.permit(:sign_in,keys:[:email, :password])
            # devise_parameter_sanitizer.permit(:account_update,keys:[:nickname,:email])
            # end
  end
end
