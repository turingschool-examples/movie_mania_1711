class Movie < ApplicationRecord
  before_save :generate_slug

  belongs_to :director

  has_many :actor_movies
  has_many :actors, through: :actor_movies
  has_many :oscars #haha
  has_many :awards, through: :oscars


  def generate_slug
    self.slug = title.parameterize
  end

  def year(award)
    oscars.find_by(award: award).year
  end
end
