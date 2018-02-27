require "rails_helper"

describe "As an unregistered User" do
  describe "when I visit the awards index" do
    before :each do
      admin = create(:admin)
      admin_2 = User.create!(username: "Shut Up and Dance", password: "kittenandthehip")
      @award = create(:award, user: admin_2)
      @award_2 = create(:award, user: admin, title: "Opakawagalaga's Recognition of Fly Catchers Who Kept Flies off of Natalie Portman")
      @director = create(:director)
      @movie = create(:movie, title: "The Mamba. That's a snake, right? Or is it a dance?", director: @director)
      @movie_2 = create(:movie, title: "Tater Tots on Parade with Alligator Booties", director: @director)
      Oscar.create!(award: @award, movie: @movie, year: 1492)
      Oscar.create!(award: @award, movie: @movie_2, year: 1776)
      Oscar.create!(award: @award_2, movie: @movie, year: 3018)
      visit awards_path
    end
    it "I cannot see a form to create new awards" do
      expect(page).to_not have_content("Create Award")
    end

    it "I can see all awards" do
      expect(page).to have_content(@award.title)
      expect(page).to have_content(@award_2.title)
    end

    it "I can click on an award to go to the show page" do
      click_on "#{@award.title}"

      expect(current_path).to eq(award_path(@award))
      expect(page).to have_content(@award.title)
      expect(page).to_not have_content(@award_2.title)
      expect(page).to have_content(@movie.title)
      expect(page).to have_content("Year Won: 1492")
      expect(page).to have_content(@movie_2.title)
      expect(page).to have_content("Year Won: 1776")
      expect(page).to_not have_content("Year Won: 3018")
    end
  end
end
