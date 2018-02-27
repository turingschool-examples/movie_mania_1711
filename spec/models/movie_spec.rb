require 'rails_helper'

describe Movie do
  describe 'relationships' do
    it {is_expected.to have_many(:awards).through(:movie_awards)}
  end
end
