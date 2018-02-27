require "rails_helper"

describe Movie do
  it { should belong_to :director }
  it { should have_many :actor_movies }
  it { should have_many :oscars } #haha
  it { should have_many(:actors).through :actor_movies }
  it { should have_many(:awards).through :oscars }
end
