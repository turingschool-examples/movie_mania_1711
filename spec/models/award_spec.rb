require "rails_helper"

describe Award do
  describe "relationships" do
    it {should belong_to(:user)}
  end
end
