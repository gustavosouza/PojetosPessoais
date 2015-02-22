class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:ddd, :name, :phone , :email, :password, :password_confirmation)
    end
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || tickets_path || root_path
  end

end
