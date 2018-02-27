class Award < ApplicationRecord
  validates_presence_of :name

  has_many :award_movies
  has_many :movies, through: :award_movies
end
