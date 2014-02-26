class ImagesController < ApplicationController
  before_filter :authenticate_user, :except => [:index, :show]

  def index
    @new_images = Image.order(:created_at).limit(10)
    @top_images = Image.by_caption_count
    @hot_images = Image.by_trending
  end

  def new
    @image = current_user.images.build
  end

  def create
    @image = current_user.images.build(params[:image])
    if @image.save
      redirect_to user_image_path(@user, @image)
    else
      render :new
    end
  end

  def show
    @image = Image.find(params[:id])
    @caption = Caption.new
  end
end
