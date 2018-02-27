require "rails_helper"

describe "as a visitor" do
  describe "when I go to a award show page" do
    before(:each) do
      @user = create(:user)
      @award = create(:award, user_id: @user.id)
      @movies = create_list(:movie, 3)
      @movies.each do |movie|
        movie.movie_awards.create(award_id: @award.id, year: 1992)
      end
    end
    it "shows title and movies" do
      visit awards_path

      click_on @award.title

      expect(page).to have_content(@award.title)
      expect(page).to have_link(@movies[0].title)
      expect(page).to have_link(@movies[1].title)
      expect(page).to have_link(@movies[2].title)
      expect(page).to have_content(': Awarded 1992')
    end
  end
end
