class Movie < ApplicationRecord
  validates_presence_of :title

  before_save :generate_slug

  belongs_to :director

  has_many :actor_movies
  has_many :actors, through: :actor_movies

  has_many :award_movies
  has_many :awards, through: :award_movies

  def generate_slug
    self.slug = title.parameterize
  end
end
