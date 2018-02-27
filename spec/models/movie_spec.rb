require "rails_helper"

describe Movie do
  it { should belong_to :director }
  it { should have_many :actor_movies }
  it { should have_many :oscars } #haha
  it { should have_many(:actors).through :actor_movies }
  it { should have_many(:awards).through :oscars }

  describe ".year" do
    it "should return a year probably" do
      admin = create(:admin)
      award = create(:award, user: admin)
      movie = create(:movie)
      Oscar.create(movie: movie, award: award, year: 10212)

      expect(movie.year(award)).to eq(10212)
    end
  end
end
