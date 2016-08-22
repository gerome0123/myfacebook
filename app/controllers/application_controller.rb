class ApplicationController < ActionController::Base
  
    rescue_from CanCan::AccessDenied do |exception|
    redirect_to '/', :alert => exception.message
    end
  before_action :authenticate_user!

  protect_from_forgery with: :exception


  before_action :configure_permitted_parameters, if: :devise_controller?

  def new

    # Override Devise default behaviour and create a profile as well
    build_resource({})
    resource.build_profile
    respond_with self.resource
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up , keys: [:email, :password, :remember_me, :profile_attributes => [:user_id, :firstname, :lastname, :mobile, :birthday, :gender]])
    devise_parameter_sanitizer.permit(:sign_in , keys: [:email, :password, :remember_me])
    devise_parameter_sanitizer.permit(:account_update , keys: [:email, :password, :password_confirmation, :current_password ])

  end


  #def configure_permitted_parameters
    #devise_parameter_sanitizer.permit(:sign_up, keys: [:id])
  #end
end
