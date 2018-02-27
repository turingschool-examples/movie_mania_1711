class Award < ApplicationRecord
  belongs_to :user

  has_many :movie_awards
  has_many :movies, through: :movie_awards
  accepts_nested_attributes_for :movie_awards

end
