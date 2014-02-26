class User < ActiveRecord::Base
  # has_secure_password

  has_many :captions
  has_many :images
  has_many :votes

  attr_accessible :name, :password
  validates :name, presence: true

  # replace lines 12-28 with line 2.
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
