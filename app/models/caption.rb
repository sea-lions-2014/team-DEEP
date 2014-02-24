class Caption < ActiveRecord::Base
  belongs_to :user
  belongs_to :image
  has_many :votes
  attr_accessible :body
  validates :body, presence: true
end