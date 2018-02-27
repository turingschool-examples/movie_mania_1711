require 'rails_helper'

describe "As an unregistered user" do
  before(:each) do
    @award_1 = Award.create!(title: "Best Picture")
    @award_2 = Award.create!(title: "Best Actress")
  end
  describe "I visit the awards index" do
    it "I can see a list of award links" do
      visit awards_path

      expect(page).to have_link(@award_1.title)
      expect(page).to have_link(@award_2.title)

      click_on(@award_1.title)

      expect(current_path).to eq(award_path(@award_1))
    end

    it "I do not see the form to create a new award" do
      visit awards_path

      expect(page).to_not have_content("New Award:")
      expect(page).to_not have_content("Submit")
    end
  end
end
