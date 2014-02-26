class Image < ActiveRecord::Base
  #add association belongs_to user after merge
  attr_accessible :url, :title, :user_id
  belongs_to :user
  has_many :captions

  validates :url, :title, presence: true

  def self.by_caption_count
    self.all.sort! { |img1, img2| img2.captions.count <=> img1.captions.count }
  end

  def self.by_trending
    self.where(created_at: 1.day.ago..Time.now).sort! { |img1, img2| img2.captions.count <=> img1.captions.count }
  end
end
