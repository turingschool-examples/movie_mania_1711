require 'rails_helper'

describe Movie, type: :model do
  describe 'relationships' do
    it {should have_many(:movie_awards)}
    it {should have_many(:awards).through(:movie_awards)}
  end
end
