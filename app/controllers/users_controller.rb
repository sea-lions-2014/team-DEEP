class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
   unless params[:user][:password].empty?
      @user = User.new(params[:user])
      @user.save
      session[:id] = @user.id
      redirect_to user_path @user
    else
      redirect_to new_user_path
    end
  end

  def show
    if logged_in?
      @user = User.find(params[:id])
      @images = @user.images

      render 'show'
    else
      redirect_to root_path
    end
  end

end