class Award < ApplicationRecord
  validates_presence_of :title
  has_many :movie_awards
  has_many :movies, through: :movie_awards
end
