require "rails_helper"

describe "visitor navigates to movie show from index" do
  it "displays movie title, and all awards for movie" do
    user = create(:user)
    movie = create(:movie, title: "Guardians of the Galaxy")
    award_1 = movie.awards.create(title: "Best Picture", user_id: user.id)
    movie_award_1 = award_1.movie_awards.find_by(movie_id: movie.id)
    movie_award_1.update(year: 2015)
    award_2 = movie.awards.create(title: "Best Picture", user_id: user.id)
    movie_award_2 = award_2.movie_awards.find_by(movie_id: movie.id)
    movie_award_2.update(year: 2014)
    award_3 = movie.awards.create(title: "Best Picture", user_id: user.id)
    movie_award_3 = award_3.movie_awards.find_by(movie_id: movie.id)
    movie_award_3.update(year: 2016)

    visit movies_path
    click_link movie.title

    expect(page).to have_content("Awards for this Movie:")
    expect(page).to have_content(award_1.title)
    expect(page).to have_content(award_2.title)
    expect(page).to have_content(award_3.title)
    expect(page).to have_content(movie_award_1.year)
    expect(page).to have_content(movie_award_2.year)
    expect(page).to have_content(movie_award_3.year)
  end
end
