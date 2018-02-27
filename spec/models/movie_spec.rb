require 'rails_helper'

describe Movie, type: :model do
  context 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
  end

  context 'relationships' do
    it { should belong_to :director }
    it { should have_many :actor_movies }
    it { should have_many :actors }
    it { should have_many :movie_awards }
    it { should have_many :awards }
  end
end
