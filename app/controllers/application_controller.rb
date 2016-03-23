class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :avatar, :password, :password_confirmation, :email) }
  end
	def after_sign_up_path_for(resource)
		welcome_test_path
	end
	def after_sign_in_path_for(resource_or_scope)
		dashboard_url
	end
end
