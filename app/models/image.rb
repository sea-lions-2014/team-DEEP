class Image < ActiveRecord::Base
  #add association belongs_to user after merge
  attr_accessible :url, :title, :user_id
  belongs_to :user
  has_many :captions
end