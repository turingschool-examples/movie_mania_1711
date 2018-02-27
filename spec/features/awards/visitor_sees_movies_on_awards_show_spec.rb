require 'rails_helper'

describe "visitor sees movies on awards show" do
  context "visits awards index and clicks on award" do
    it "brough to award show and movies that won are shown with year" do
      director = Director.create!(name: "Joel Coen")
      fargo = director.movies.create!(title: "Fargo",
                                      description: "ransom gone wrong")
      award = Award.create!(name: "Best Picture")
      AwardMovie.create!(award_id: award.id, movie_id: fargo.id, year: 1996)
      director = Director.create!(name: "Steven Spieldberg")
      gump = director.movies.create!(title: "Forrest Gump",
                                     description: "20th century history through the eyes of an unsuspecting individual")
      AwardMovie.create!(award_id: award.id, movie_id: gump.id, year: 1994)

      visit awards_path
      click_on("Best Picture")

      expect(current_path).to eq(award_path(award))
      expect(page).to have_content("Fargo")
      expect(page).to have_content("Year Won: 1996")
      expect(page).to have_content("Forrest Gump")
      expect(page).to have_content("Year Won: 1994")
    end
  end
end

# As an unregistered user,
# When I visit the awards index,
# And I click on "Best Picture",
# I see a page with the awards's title,
# I see the movie "Guardians of the Galaxy" and "Suicide Squad" listed
# I also see when the movie received the award.
