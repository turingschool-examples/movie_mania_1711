require 'rails_helper'

describe MovieAward, type: :model do
  describe 'relationships' do
    it {should belong_to(:movie)}
    it {should belong_to(:award)}
  end
end
