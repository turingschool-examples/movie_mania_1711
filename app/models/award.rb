class Award < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  belongs_to :user
  has_many :oscars
  has_many :movies, through: :oscars
end
