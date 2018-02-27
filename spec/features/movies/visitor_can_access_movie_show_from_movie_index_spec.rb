require 'rails_helper'

describe "visitor can access movie show" do
  context "visits movie index" do
    it "clicks on movie title and is brought to show" do
      director = Director.create!(name: "Joel Coen")
      movie = director.movies.create!(title: "Fargo",
                                      description: "ransom gone wrong")

      visit director_movies_path(director)
      click_on("Fargo")

      expect(current_path).to eq(movie_path(movie.slug))
      expect(page).to have_content(movie.title)
    end

    it "show displays award names and year won" do
      director = Director.create!(name: "Joel Coen")
      movie = director.movies.create!(title: "Fargo",
                                      description: "ransom gone wrong")
      award_1 = movie.awards.create!(name: "Best Picture")
      AwardMovie.find(1).update(year: 1996)
      award_2 = movie.awards.create!(name: "Best Sound")
      AwardMovie.find(2).update(year: 1996)
      award_3 = movie.awards.create!(name: "Best Action Film")
      AwardMovie.find(3).update(year: 1996)

      visit director_movies_path(director)
      click_on("Fargo")

      expect(page).to have_content("Awards won:")
      expect(page).to have_content("Best Picture, Year: 1996")
      expect(page).to have_content("Best Sound, Year: 1996")
      expect(page).to have_content("Best Action Film, Year: 1996")
    end
  end
end

# As an unregistered user,
# When I visit the movie index,
# And I click on "Guardians of the Galaxy"
# I see a page with "Guardians of the Galaxy",
# I also see "Best Picture", "Best Sound", "Best Action Film" under an "Awards for this Movie:" heading
# I also see what year the award was won (year should be an attribute of the join table).
