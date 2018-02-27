require 'rails_helper'

describe Award, type: :model do
  describe 'relationships' do
    it {should have_many(:movie_awards)}
    it {should have_many(:movies).through(:movie_awards)}
  end
end
