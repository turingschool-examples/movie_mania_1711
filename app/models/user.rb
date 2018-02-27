class User < ApplicationRecord
  has_secure_password

  validates_presence_of :username
  validates_uniqueness_of :username

  has_many :user_awards
  has_many :awards, through: :user_awards

  enum role: ["default", "admin"]
end
