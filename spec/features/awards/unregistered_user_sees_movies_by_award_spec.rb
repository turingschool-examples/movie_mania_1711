require 'rails_helper'

describe "As an unregistered user" do
  describe "I visit the awards index" do
    it "I can clink in to an awards show page" do
      award = Award.create!(title: "Best Picture")
      director = Director.create!(name: "Megan")
      movie_1 = director.movies.create!(title: "Guardians of the Galaxy", description: "Hilarity and Music", slug: "gardians-of-the-galaxy")
      movie_2 = director.movies.create!(title: "Suicide Squad", description: "Hilarity and Clown Makeup", slug: "suicide-squad")
      MovieAward.create!(award: award, movie: movie_1, year: 2014)
      MovieAward.create!(award: award, movie: movie_2, year: 2016)

      visit awards_path

      click_on("Best Picture")

      expect(current_path).to eq(award_path(award))
      expect(page).to have_content("Best Picture")
      expect(page).to have_content("Past Winners:")
      expect(page).to have_content("2014 - Guardians of the Galaxy")
      expect(page).to have_content("2016 - Suicide Squad")
    end
  end
end
