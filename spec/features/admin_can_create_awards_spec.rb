require 'rails_helper'

# As an admin user,
# When I visit the awards index,
# I can see a form to create new awards,
# When I fill out the form with the awards title,
# And click submit,
# I see a list of awards I have created.

describe "create award" do
  it "allows user logged in as admin to create a new award from awards index" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit awards_path

    fill_in "Title", with: "Best Tomato"
    click_on "Create Award"

    expect(current_path).to eq(user_path(admin))
    expect(page).to have_content("Best Tomato")
  end
end
