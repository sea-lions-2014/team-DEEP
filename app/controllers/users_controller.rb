class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if !params[:user][:password].empty?
      @user = User.new(params[:user])
      @user.save!
    # else
    #   render new_user_path
    end
  end

end