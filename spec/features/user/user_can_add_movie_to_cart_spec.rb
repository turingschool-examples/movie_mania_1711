require "rails_helper"

describe "as a visitor" do
  describe "when I visit movies index" do
    describe "when I click on Add Movie" do
      it "adds a movie to the cart" do
        movie = create(:movie)

        visit director_movies_path(movie.director)

        click_on "Add Movie"

        expect(current_path).to eq(director_movies_path(movie.director))
        expect(page).to have_content("You now have 1 #{movie.title} in your cart.")
      end
    end

    describe "when I add multiple movies" do
      it "adds all of the movies to the cart" do
        director = create(:director)
        movie = create(:movie, director: director)

        visit director_movies_path(director)
        expect(page).to have_content("Cart: 0")

        click_on "Add Movie"

        expect(page).to have_content("You now have 1 #{movie.title} in your cart.")
        expect(page).to have_content("Cart: 1")

        click_on "Add Movie"

        expect(current_path).to eq(director_movies_path(director))
        expect(page).to have_content("You now have 2 #{movie.title}s in your cart.")
        expect(page).to have_content("Cart: 2")
      end
    end
  end
end
