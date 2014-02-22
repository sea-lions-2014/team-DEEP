module ApplicationHelper

  def logged_in?
    session[:id].present?
  end

  def current_user
    return nil unless logged_in?
    @current_user ||= User.find(session[:id])
  end

end
