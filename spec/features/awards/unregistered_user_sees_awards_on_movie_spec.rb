require 'rails_helper'

describe "As an unregistered user" do
  describe "I visit a movies index" do
    it "I can link to a movie show page" do
      director = Director.create!(name: "Megan")
      movie = director.movies.create!(title: "Guardians of the Galaxy", description: "Hilarity and Music", slug: "gardians-of-the-galaxy")
      award_1 = movie.awards.create!(title: "Best Sound", year: 2014)
      award_1 = movie.awards.create!(title: "Best Picture", year: 2014)
      award_1 = movie.awards.create!(title: "Best Action Film", year: 2014)

      visit movie_path(movie)

      expect(page).to have_content("Awards for this Movie:")
      expect(page).to have_content("Best Picture - 2014")
      expect(page).to have_content("Best Sound - 2014")
      expect(page).to have_content("Best Action Film - 2014")
    end
  end
end
