require 'rails_helper'

context 'As an unregistered user,' do
  describe 'When I visit the movie index,' do
    describe 'And I click on "Guardians of the Galaxy"' do
      before(:each) do
        @movie = create(:movie, title: 'Guardians of the Galaxy')
        awards = [create(:award, title:"Best Picture"),
                  create(:award, title: "Best Sound"),
                  create(:award, title: "Best Action Film")]
        awards.each do |award|
          MovieAward.create!(movie: @movie, award: award, year: 2017)
        end
      end
      scenario 'I see a page with "Guardians of the Galaxy"' do
        visit director_movies_path(@movie.director)

        expect(page).to have_link(@movie.title)
      end

      scenario 'I also see a list of awards for the movie and the year the award was won' do
        visit director_movies_path(@movie.director)

        expect(page).to have_content("Awards for this Movie:")
        @movie.movie_awards.each do |movie_award|
          expect(page).to have_content("#{movie_award.award.title}(#{movie_award.year})")
        end
      end
    end
  end
end
