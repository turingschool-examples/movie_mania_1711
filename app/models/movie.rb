class Movie < ApplicationRecord
  before_save :generate_slug

  belongs_to :director

  has_many :actor_movies
  has_many :actors, through: :actor_movies


  def generate_slug
    self.slug = title.parameterize
  end
end
