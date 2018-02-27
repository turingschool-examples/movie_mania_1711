require 'rails_helper'

context 'As an unregistered user,' do
  describe 'When I visit the awards index,' do
    scenario 'I cannot see the form to create new awards,' do
      visit awards_path

      expect(page).to_not have_field('title')
      expect(page).to_not have_button('Submit')
    end
    scenario "I see all awards (at least 2) and each links to that award's page" do
      awards = create_list(:award, 3)
      visit awards_path

      awards.each do |award|
        expect(page).to have_link(award.title)
      end
    end
  end
end
