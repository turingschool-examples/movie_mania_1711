require 'rails_helper'

describe "admin can create an award" do
  context "visits awards index" do
    it "fills out form, submits, and sees created awards" do
      admin = User.create!(username: "bob", password: "test", role: 1)

      visits awards_path
      fills_in('Name', with: "Best Picture")
      click_on('Create Award')

      expect(current_path).to eq(awards_path)
      expect(page).to have_content("Best Picture")
    end
  end
end

# As an admin user,
# When I visit the awards index,
# I can see a form to create new awards,
# When I fill out the form with the awards title,
# And click submit,
# I see a list of awards I have created.
