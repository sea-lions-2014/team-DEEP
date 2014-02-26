module ApplicationHelper
  def image_list title, list
    "<h3>Top</h3>"
    render 'images_list', images_list: @top_images
  end
end
