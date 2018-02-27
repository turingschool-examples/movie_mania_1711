require 'rails_helper'    

describe "As a visitor" do
  describe "When I visit the awards index," do
    before(:each) do
      award_1 = Award.create(title: "M-E") 
      award_2 = Award.create(title: "This is an Award") 

    end
    
    it "I fill out the form with the awards title" do

      visit awards_path

      expect(page).to have_content("Awards")

      fill_in "award[title]", with: "M-E"

      click_on "Submit"

      expect(page).to have_content("M-E")
      expect(page).to have_content("This is an Award")

    
    end
  end
end
