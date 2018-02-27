require 'rails_helper'

describe "visitor goes to awards index" do
  it "does not display new award form" do
    award_1 = Award.create!(name: "Best Picture")
    award_2 = Award.create!(name: "Best Actor")

    visit awards_path

    expect(page).to_not have_content('Name')
    expect(page).to have_content("Best Picture")
    expect(page).to have_content("Best Actor")
  end

  it "awards listed link to show page" do
    award_1 = Award.create!(name: "Best Picture")
    award_2 = Award.create!(name: "Best Actor")

    visit awards_path
    click_on(award_1.name)

    expect(current_path).to eq(award_path(award_1))
    expect(page).to have_content("Best Picture")
  end
end

# As an unregistered user,
# When I visit the awards index,
# I cannot see the form to create new awards,
# I see all awards (for testing purposes, I should see at least 2)
# and each award should be a link to that award's specific page
