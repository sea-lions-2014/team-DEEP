class SessionsController < ApplicationController
  def new
  end

  def create
    if @user = User.authenticate( params[:session] )
      login @user
      redirect_to @user
    else
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
