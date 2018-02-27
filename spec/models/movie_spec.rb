require 'rails_helper'

describe Movie do
  describe 'relationships' do
    it {should have_many :movie_awards}
    it {should have_many :awards}
  end
end
