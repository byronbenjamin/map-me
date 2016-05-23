class User < ActiveRecord::Base

  has_secure_password

  has_many :trips
  has_many :future_trips

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true 

end
