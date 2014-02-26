class UsersController < ApplicationController
  before_filter :authenticate_user, :only => [:show]

  def new
    @user = User.new
  end

  def create
   unless params[:user][:password].empty?
      @user = User.new(params[:user])
      @user.save
      login(@user)
      redirect_to @user
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    @images = @user.images
  end
end
