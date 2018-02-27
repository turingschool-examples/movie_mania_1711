require "rails_helper"

describe "As an Admin" do
  describe "when I visit the awards index" do
    it "I can see a form to create new awards" do
      admin = create(:admin)
      admin_2 = User.create!(username: "Shut Up and Dance", password: "kittenandthehip")
      award = create(:award, user: admin_2)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit awards_path

      fill_in "award[title]", with: "The Opakawagalaga Award For The Excellence In Rehearsing"
      click_on "Create Award"

      expect(page).to have_content("The Opakawagalaga Award For The Excellence In Rehearsing")
      expect(page).to_not have_content(award.title)
    end
  end
end
