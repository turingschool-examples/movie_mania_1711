require 'rails_helper'

RSpec.describe MovieAward, type: :model do
  describe "relationships" do
    it {should belong_to(:movie)}
    it {should belong_to(:award)}
  end
end
