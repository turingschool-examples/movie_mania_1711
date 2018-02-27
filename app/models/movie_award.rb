class MovieAward < ApplicationRecord
  validates_presence_of :year
  belongs_to :award
  belongs_to :movie
end
