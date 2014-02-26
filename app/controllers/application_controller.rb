class ApplicationController < ActionController::Base
  protect_from_forgery

  def login(user)
    session[:id] = user.id
  end

  def logged_in?
    current_user.present?
  end

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  def authenticate_user
    redirect_to new_user_path unless logged_in?
  end

  helper_method :logged_in?, :current_user

end
