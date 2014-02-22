class SessionsController < ApplicationController
  def new
    render 'new'
  end

  def create
    if @user = User.authenticate( params[:session] )
      session[:id] = @user.id
      redirect_to user_path @user
    else
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to request.referer
  end
end