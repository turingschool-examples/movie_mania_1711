require 'rails_helper'

describe MovieAward, type: :model do
  context 'validations' do
    it { should validate_presence_of :year }
  end

  context 'relationships' do
    it { should belong_to :award }
    it { should belong_to :movie }
  end
end
