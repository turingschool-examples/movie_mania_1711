require "rails_helper"

describe "as an admin" do
  before :each do
    @director = Director.create!(name: "james")
    @movie = Movie.create!(title: "fargo", description: "it aight", director: @director)
    @admin = User.create!(username: "cameron", password: "password", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end
  describe "when i visit awards index" do
    it "shows a form to create new awards that works" do

      visit awards_path

      fill_in "Title", with: "the best"
      click_on "Create Award"

      expect(page).to have_content("the best")
    end
  end
end
