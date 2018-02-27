require 'rails_helper'

RSpec.describe Award, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }

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
