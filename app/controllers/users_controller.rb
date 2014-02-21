class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    p params
    User.create(params[:user])
  end

end