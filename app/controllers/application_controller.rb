class ApplicationController < ActionController::Base
  helper_method :current_user

<<<<<<< HEAD
  def current_user
    @current_user ||= User.first
=======
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    attributes = [:name]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
>>>>>>> 6640f6b7b802eb5598e9fb7de6d1b37490b95fd9
  end
end