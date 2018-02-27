require 'rails_helper'

describe Award, type: :model do
  describe "Relationships" do
    it {should have_many(:movie_awards)}
    it {should have_many(:movies).through(:movie_awards)}
    it {should belong_to(:user)}
  end

  describe "Instance Method" do
    before(:each) do
      user = create(:user)
      movie = create(:movie)
      @award = create(:award, user_id: user.id)
      MovieAward.create!(movie_id: movie.id, award_id: @award.id, year: 1200)
    end
    describe "#award_year" do
      it "returns the year of movie awards" do
        expect(@award.award_year).to eq(1200)
      end
    end
  end
end
