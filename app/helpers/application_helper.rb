module ApplicationHelper

  def logged_in?
    session[:id].present?
  end

  def current_user
    return nil unless logged_in?
    @current_user ||= User.find(session[:id])
  end

  def get_images_by_caption_count
    Image.all.sort! { |img1, img2| img2.captions.count <=> img1.captions.count }
  end

  def get_images_by_trending
    Image.where(created_at: 1.day.ago..Time.now).sort! { |img1, img2| img2.captions.count <=> img1.captions.count }
  end

end
