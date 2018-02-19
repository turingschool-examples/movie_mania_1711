require 'rails_helper'

describe "actor movie show" do
  it "can create new actor movie" do
    movie = create(:movie)

    visit new_movie_actor_path(movie)

    fill_in :name, with: "Leonardo Dicaprio"

    expect(current_path).to eq(actor_path(Actor.last))
    expect(page).to have_content("Leonardo Dicaprio")
  end


  lakjdfl;akjdf;lkajd;lkfj;dlkjf
end
