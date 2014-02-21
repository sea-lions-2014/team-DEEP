class Image < ActiveRecord::Base
  #add association belongs_to user after merge
  attr_accessible :url, :title
end