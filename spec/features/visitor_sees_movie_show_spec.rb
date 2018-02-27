require "rails_helper"

# As an unregistered user,
# When I visit the movie index,
# And I click on "Guardians of the Galaxy"
# I see a page with "Guardians of the Galaxy",
# I also see "Best Picture", "Best Sound", "Best Action Film" under an "Awards for this Movie:" heading
# I also see what year the award was won (year should be an attribute of the join table).

describe "visitor navigates to movie show from index" do
  it "displays movie title, and all awards for movie" do
    user = create(:user)
    movie = create(:movie, title: "Guardians of the Galaxy")
    award_1 = movie.awards.create(title: "Best Picture", user_id: user.id)
    award_2 = movie.awards.create(title: "Best Picture", user_id: user.id)
    award_3 = movie.awards.create(title: "Best Picture", user_id: user.id)

    visit movies_path
    click_link movie.title

    expect(page).to have_conent(award_1.title)
    expect(page).to have_conent(award_2.title)
    expect(page).to have_conent(award_3.title)
  end
end
