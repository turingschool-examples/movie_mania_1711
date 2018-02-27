require 'rails_helper'

describe "As an unregistered user" do
  describe "I visit a movies index" do
    it "I can link to a movie show page" do
      director = Director.create!(name: "Megan")
      movie = director.movies.create!(title: "Guardians of the Galaxy", description: "Hilarity and Music", slug: "gardians-of-the-galaxy")
      award_1 = Award.create!(title: "Best Sound")
      award_2 = Award.create!(title: "Best Picture")
      award_3 = Award.create!(title: "Best Action Film")
      MovieAward.create(movie: movie, award: award_1, year: 2014)
      MovieAward.create(movie: movie, award: award_2, year: 2014)
      MovieAward.create(movie: movie, award: award_3, year: 2014)

      visit movie_path(movie.slug)

      expect(page).to have_content("Awards for this Movie:")
      expect(page).to have_content("Best Picture - 2014")
      expect(page).to have_content("Best Sound - 2014")
      expect(page).to have_content("Best Action Film - 2014")
    end
  end
end
