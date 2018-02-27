require 'rails_helper'

describe Movie, type: :model do
  describe "validations" do
    it {should validate_presence_of(:title)}
  end

  describe "relationships" do
    it {should have_many(:award_movies)}
    it {should have_many(:awards).through(:award_movies)}
  end
end
