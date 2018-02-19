require 'rails_helper'

describe "actor movie show" do
  it "can create new actor movie" do
    movie = create(:movie)

    visit new_movie_actor_path(movie)

    fill_in :name, with: "Leonardo Dicaprio"

    expect(current_path).to eq(movie_actors_path(movie))
    expect(page).to have_content("Leonardo Dicaprio")
  end
end
