require "rails_helper"

describe "user sees all movies" do
  before(:each) do
    admin = create(:admin)
    @director = create(:director)
    @movie = create(:movie, title: "Guardians of the Galaxy", director: @director)
    @award_1 = Award.create!(user: admin, title: "Best Picture")
    @award_2 = Award.create!(user: admin, title: "Best Action Film")
    @award_3 = Award.create!(user: admin, title: "Best Sound")
    Oscar.create!(award: @award_1, movie: @movie, year: 1492)
    Oscar.create!(award: @award_2, movie: @movie, year: 1776)
    Oscar.create!(award: @award_3, movie: @movie, year: 3018)
    @movies = create_list(:movie, 2, director: @director)
  end
  describe "they visit movie index" do

    it "sees all the movies" do

      visit director_movies_path(@director)

      expect(page).to have_content("All Movies")
      expect(page).to have_content(@movies[0].title)
      expect(page).to have_content(@movies[0].description)
      expect(page).to have_content(@movies[1].title)
      expect(page).to have_content(@movies[1].description)
    end

    it "I see the awards the movie has won when I visit the show page" do
      visit director_movies_path(@director)

      click_on "#{@movie.title}"

      expect(current_path).to eq(movie_path(@movie.slug))
      expect(page).to have_content(@award_1.title)
      expect(page).to have_content("Year: 1492")
      expect(page).to have_content(@award_2.title)
      expect(page).to have_content("Year: 1776")
      expect(page).to have_content(@award_3.title)
      expect(page).to have_content("Year: 3018")
    end
  end
end
