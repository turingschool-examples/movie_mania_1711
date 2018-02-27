require 'rails_helper'

describe Award, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
  end

  describe "relationships" do
    it {should have_many(:award_movies)}
    it {should have_many(:movies).through(:award_movies)}
  end
end
