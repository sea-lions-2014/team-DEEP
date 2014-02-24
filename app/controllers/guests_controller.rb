class GuestsController < ApplicationController
  include ApplicationHelper
  def index
    @new_images = Image.order(:created_at).limit(10)
    @top_images = get_images_by_caption_count
    @hot_images = get_images_by_trending
  end
end