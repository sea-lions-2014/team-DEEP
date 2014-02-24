class Vote < ActiveRecord::Base
  attr_accessible :user_id, :caption_id
  belongs_to :user
  belongs_to :caption
  validates :user_id, uniqueness: {scope: :caption_id}
end