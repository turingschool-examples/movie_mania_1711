require "rails_helper"

describe "user sees all movies" do
  before(:each) do
    @director = create(:director)
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
  end
end
