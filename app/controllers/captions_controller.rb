class CaptionsController < ApplicationController

  def create
    @image = Image.find params[:image_id]
    @caption = @image.captions.build(params[:caption])
    if @caption.save
      render partial: 'caption', locals: {caption: @caption}
    else
      redirect :back
    end
  end
end