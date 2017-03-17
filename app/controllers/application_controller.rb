class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
<<<<<<< HEAD
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:photo, :utr, :location, :role, :college_tennis, :description, :name])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:photo, :utr, :location, :role, :college_tennis, :description, :name])
=======
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:college_tennis, :role, :photo, :description, :utr, :location])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:college_tennis, :role, :photo, :description, :utr, :location])
>>>>>>> origin/master
  end
end
