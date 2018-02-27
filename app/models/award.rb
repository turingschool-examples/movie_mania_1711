class Award < ApplicationRecord
  belongs_to :user

  has_many :movie_awards
  has_many :movies, through: :movie_awards

  def award_year
    movie_awards.first.year
  end

end
