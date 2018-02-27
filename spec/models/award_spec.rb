require "rails_helper"

describe Award do
  describe "relationships" do
    it {should belong_to(:user)}
    it {is_expected.to have_many(:movies).through(:movie_awards)}
  end
end
