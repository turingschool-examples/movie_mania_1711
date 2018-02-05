require 'rails_helper'

describe Actor, type: :model do
  describe "relationships" do
    it { is_expected.to have_many(:movies).through(:actor_movies) }
  end
end
