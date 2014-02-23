class Caption < ActiveRecord::Base
  belongs_to :user
  belongs_to :image
  attr_accessible :body
end