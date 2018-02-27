require "rails_helper"

describe "As an unregistered User" do
  describe "when I visit the awards index" do
    before :each do
      admin = create(:admin)
      admin_2 = User.create!(username: "Shut Up and Dance", password: "kittenandthehip")
      @award = create(:award, user: admin_2)
      @award_2 = create(:award, user: admin, title: "Opakawagalaga's Recognition of Fly Catchers Who Kept Flies off of Natalie Portman")
      visit awards_path
    end
    it "I cannot see a form to create new awards" do
      expect(page).to_not have_content("Create Award")
    end

    it "I can see all awards" do
      expect(page).to have_content(@award.title)
      expect(page).to have_content(@award_2.title)
    end

    it "I can click on an award to go to the show page" do
      click_on "#{@award.title}"

      expect(current_path).to eq(award_path(@award))
      expect(page).to have_content(@award.title)
      expect(page).to_not have_content(@award_2.title)
    end
  end
end
