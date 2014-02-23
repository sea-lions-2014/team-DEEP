require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_many :captions
  has_many :images

  attr_accessible :name, :password
  validates :name, presence: true


  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end


  def self.authenticate session_params
    if user = User.find_by_name(session_params[:name])
      return user if user.password == session_params[:password]
    else
      return false
    end
  end

end