class ApplicationController < ActionController::Base
  protect_from_forgery

  def logged_in?
    session[:id].present?
  end

  def current_user
    return nil unless logged_in?
    @current_user ||= User.find(session[:id])
  end

  helper_method :logged_in?, :current_user

end
