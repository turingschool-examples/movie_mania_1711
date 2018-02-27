class User < ApplicationRecord
  has_secure_password
  has_many :awards

  validates_presence_of :username
  validates_uniqueness_of :username

  enum role: ["default", "admin"]
end
