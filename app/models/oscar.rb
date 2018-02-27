class Oscar < ApplicationRecord
  belongs_to :movie
  belongs_to :award
  validates_presence_of :year
end
