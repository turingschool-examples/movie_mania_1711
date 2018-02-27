class Award < ApplicationRecord
  validate :title, presence: true, uniqueness: true
end
