require "rails_helper"

describe MovieAward do
  describe "relationships" do
    it { is_expected.to belong_to(:movie) }
    it { is_expected.to belong_to(:award) }
  end
end
