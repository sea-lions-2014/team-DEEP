class ImagesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @image = @user.images.build
  end

  def create
    @user = User.find(params[:user_id])
    @image = @user.images.build(params[:image])
    if @image.save
      redirect_to user_image_path(@user, @image)
    else
      render :new
    end
  end

  def show
    @image = Image.find(params[:id])
    @user = @image.user
  end

end