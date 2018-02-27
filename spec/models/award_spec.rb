require "rails_helper"

describe Award do
  describe "relationships" do
    it { is_expected.to have_many(:movies).through(:movie_awards) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
  end
end
