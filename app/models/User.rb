class User < ActiveRecord::Base
  attr_accessible :name, :password
  validates :name, :password, presence: true
end