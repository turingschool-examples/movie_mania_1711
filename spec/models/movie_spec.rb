require 'rails_helper'

describe Movie, type: :model do
  describe "Relationships" do
    it { should have_many(:movie_awards)}
    it { should have_many(:awards).through(:movie_awards) }
    it { should have_many(:awards).through(:movie_awards) }
    it { should have_many(:actor_movies) }
    it { should have_many(:actors).through(:actor_movies) }
    it { should belong_to(:director) }
  end

  describe "Instance Methods" do
    describe "#award_year" do
      before(:each) do
        user = create(:user)
        @movie = create(:movie)
        award = create(:award, user_id: user.id)
        MovieAward.create!(movie_id: @movie.id, award_id: award.id, year: 1200)
      end
      it "should return year of award" do
        expect(@movie.award_year).to eq(1200)
      end
    end
  end
end
