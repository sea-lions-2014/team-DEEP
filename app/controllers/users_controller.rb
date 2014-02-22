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
      redirect_to user_path @user
    else
      redirect_to new_user_path
    end
  end

  def show
    if logged_in?
      render 'show'
    else
      redirect_to root_path
    end
  end

end