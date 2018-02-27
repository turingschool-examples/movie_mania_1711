require 'rails_helper'

describe Award, type: :model do
  context 'validations' do
    it { should validate_presence_of :title }
  end

  context 'relationships' do
    it { should have_many :movie_awards }
    it { should have_many :movies }
  end
end
