require 'rails_helper'    

describe "As a visitor" do
  describe "When I visit the awards index," do
    
    it "I fill out the form with the awards title" do
      admin = User.create(username: "Me", password: "pass", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    
      # award = Award.create(title: "This is an Award") 

      visit awards_path

      expect(page).to have_content("Awards")
      
      fill_in "award[title]", with: "M-E"

      click_on "Create Award"
save_and_open_page

      expect(page).to have_content("M-E")
      expect(page).to have_content("This is an Award")

    
    end
  end
end
