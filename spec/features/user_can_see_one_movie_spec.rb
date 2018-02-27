require 'rails_helper'

describe "user sees one movie" do
  it "user sees one movie with title and description" do
    movie = create(:movie)

    visit movie_path(movie.slug)

    expect(current_path).to eq(movie_path(movie.slug))

    expect(page).to have_content(movie.title)
    expect(page).to have_content(movie.description)
  end
  before(:each) do
    @movie = create(:movie)
    @user = create(:user)
    @awards = create_list(:award, 3, user_id: @user.id)
    @awards.each do |award|
      award.movie_awards.create(movie_id: @movie.id, year: 1992)
    end
  end
  it "shows all awards for movie" do
    visit movie_path(@movie.slug)

    expect(page).to have_link(@awards[0].title)
    expect(page).to have_link(@awards[1].title)
    expect(page).to have_link(@awards[2].title)
    expect(page).to have_content("Awarded in 1992")
    expect(page).to have_content('Awards for this Movie:')
  end
end
