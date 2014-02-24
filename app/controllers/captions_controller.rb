class CaptionsController < ApplicationController

  def create
    @image = Image.find params[:image_id]
    @caption = @image.captions.build(params[:caption])
    if @caption.save
      render partial: 'caption', locals: {caption: @caption}
    else
      redirect_to 'images#show'
    end
  end

  def vote_up
    @caption = Caption.find(params[:id])
    @image = @caption.image
    @user = User.find(session[:id])
    @vote = @user.votes.build(caption_id: @caption.id)
    if @vote.save
      @caption.increment!(:score, 1)
      render json: {score: @caption.score}
    end
  end
end