require "rails_helper"

describe "as a visitor" do
  before :each do
    @director = Director.create!(name: "james")
    @movie = Movie.create!(title: "fargo", description: "it aight", director: @director)
    @award1 = Award.create!(title: "the best")
    @award2 = Award.create!(title: "the worst")
    @movie.movie_awards.create!(movie: @movie, award: @award1, year: 2010)
    @movie.movie_awards.create!(movie: @movie, award: @award2, year: 2012)
  end
  describe "when i visit movie index" do
    describe "and click on a movie" do
      it "shows awards for that movie" do
        visit director_movies_path(@director)

        click_on "fargo"

        expect(page).to have_content("Awards for this Movie:")
        expect(page).to have_content(@award1.title)
        expect(page).to have_content("2010")
        expect(page).to have_content(@award1.title)
        expect(page).to have_content("2012")
      end
    end
  end
end
# I also see what year the award was won
#   (year should be an attribute of the join table).
