require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_many :captions
  has_many :images

  attr_accessible :name, :password, :id
  validates :name, :password, presence: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end


end