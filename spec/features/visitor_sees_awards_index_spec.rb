require "rails_helper"

describe "visitor sees awards index" do
  it "displays list of awards" do
    user = create(:user)
    award_1 = user.awards.create(title: "Best Grapefruit")
    award_2 = user.awards.create(title: "Best Cucumber")

    visit awards_path

    expect(page).to have_content(award_1.title)
    expect(page).to have_content(award_2.title)
    expect(page).to_not have_content("Create Award")
  end
end
