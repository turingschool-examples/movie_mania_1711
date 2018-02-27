require "rails_helper"

describe "as a visitor" do
  describe "visit awards index" do
    describe "click an award title" do
      it "shows movies that have won that award and which year they won" do
        @director = Director.create!(name: "james")
        @movie1 = Movie.create!(title: "fargo", description: "it aight", director: @director)
        @movie2 = Movie.create!(title: "nearstay", description: "it aight", director: @director)
        @award1 = Award.create!(title: "the best")
        @movie1.movie_awards.create!(movie: @movie, award: @award1, year: 2010)
        @movie2.movie_awards.create!(movie: @movie, award: @award1, year: 2012)

        visit awards_path

        click_on "the best"

        expect(page).to have_content("movies that have won this award: fargo")
        expect(page).to have_content("movies that have won this award: nearstay")
        expect(page).to have_content("year won: 2010")
        expect(page).to have_content("year won: 2012")
      end
    end
  end
end

# As an unregistered user,
# When I visit the awards index,
# And I click on "Best Picture",
# I see a page with the awards's title,
# I see the movie "Guardians of the Galaxy" and "Suicide Squad" listed
# I also see when the movie received the award.
