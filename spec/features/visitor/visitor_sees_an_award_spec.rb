require 'rails_helper'

context 'As an unregistered user' do
  describe 'When I visit the awards index' do
    describe 'And I click on "Best Picture"' do
      before(:each) do
        @award = Award.create!(title: "Best Picture")
        movies = [create(:movie, title: "Guardians of the Galaxy"),
                  create(:movie, title: "Suicide Squad")]
        movies.each do |movie|
          @award.movie_awards.create!(movie: movie, year: 2018)
        end
      end
      scenario "I see a page with the awards's title" do
        visit awards_path

        click_link @award.title

        expect(page).to have_text(@award.title)
      end

      scenario 'I see the movie "Guardians of the Galaxy" and "Suicide Squad" listed' do
        visit award_path(@award)

        @award.movies.each do |movie|
          expect(page).to have_content(movie.title)
        end
      end

      scenario 'I also see when the movie received the award' do
        visit award_path(@award)

        @award.movie_awards do |movie_award|
          expect(page).to have_content(movie_award.year)
        end
      end
    end
  end
end
