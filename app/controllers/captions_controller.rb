class CaptionsController < ApplicationController
  before_filter :authenticate_user
  def create
    @image = Image.find params[:image_id]
    @caption = @image.captions.build(params[:caption])
    if @caption.save
      render partial: 'caption', locals: {caption: @caption}
    else
      render :text => @caption.errors.full_messages.join(", "), :status => :unprocessable_entity
    end
  end

  def vote_up
    @caption = Caption.find(params[:id])
    @vote = current_user.votes.build(caption_id: @caption.id)
    if @vote.save
      # this should move to a model callback.
      @caption.increment!(:score, 1)
      render json: {score: @caption.score}
    end
  end
end
