require 'rails_helper'

describe AwardMovie, type: :model do
  describe "relationships" do
    it {should belong_to(:award)}
    it {should belong_to(:movie)}
  end
end
