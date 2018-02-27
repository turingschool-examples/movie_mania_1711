class Award < ApplicationRecord
  validates_presence_of :title
  has_many :user_awards
  has_many :users, through: :user_awards

end