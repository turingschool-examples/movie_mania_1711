require 'rails_helper'

describe "as a visitor" do
  describe "when I visit the awards path" do
    before(:each) do
      @user = create(:user)
      @awards = create_list(:award, 4, user_id: @user.id)
    end
    it "shows all awards" do
      visit awards_path

      expect(page).to have_link(@awards[0].title)
      expect(page).to have_link(@awards[1].title)
      expect(page).to have_link(@awards[2].title)
      expect(page).to have_link(@awards[3].title)
      expect(page).to_not have_link("Create New Award")
    end
  end
end
