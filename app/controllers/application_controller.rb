class ApplicationController < ActionController::Base
  before_filter :record_user_activity


  private

  def record_user_activity
    if current_user
      current_user.touch :last_activity_at
    end
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :current_password, :asset) }
  end

  layout :another_by_method
  private
  def another_by_method
    if current_user.nil?
      "normal"
    else
      "member"
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to posts_path, :alert => exception.message
  end
end
