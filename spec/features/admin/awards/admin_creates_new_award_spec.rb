require 'rails_helper'

context 'As an admin user,' do
  describe 'When I visit the awards index,' do
    before(:each) do
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    end
    describe 'I fill out a form with the awards title and click submit' do
      scenario 'I can see a list of awards I have created' do
        visit 'admin/awards'

        fill_in 'award[title]', with: 'Best Picture'
        click_on 'Submit'

        expect(page).to have_content('Awards: Best Picture')
      end
    end
  end
end
