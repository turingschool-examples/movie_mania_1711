require 'rails_helper'

   describe 'admin sees award index and link to create a new award'  do
     it 'after creating award they click submit and sees all awards' do
       user = User.create(username: "kyle", password: "password", role: 1)
       movie_1 = Movie.create(title:"something good", description:"some eoetingd")
       movie_2 = Movie.create(title:"something else", description:"a movie about a movie")
       award_1 = Award.create(title: "best picture", movie: movie_1)
       award_2 = Award.create(title: "best actor", movie: movie_2 )
       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

       visit admin_awards_path

       expect(page).to have_content("Create new award")
        expect(page).to have_content("best picture")
        expect(page).to have_content("best actor")


     end
   end

   describe 'user does not see link to create a new award'  do
     it 'they see list of all awards' do
       user = User.create(username: "kyle", password: "password")
       movie_1 = Movie.create(title:"something good", description:"some eoetingd")
       movie_2 = Movie.create(title:"something else", description:"a movie about a movie")
       award_1 = Award.create(title: "best picture", movie: movie_1)
       award_2 = Award.create(title: "best actor", movie: movie_2 )
       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

       visit  awards_path

        expect(page).to_not have_content("Create new award")
        expect(page).to have_content("Awards")
        expect(page).to have_content("best picture")
        expect(page).to have_content("best actor")




     end
   end


      describe 'admin sees award index and link to create a new award'  do
        it 'after creating award they click submit and sees all awards' do
          user = User.create(username: "kyle", password: "password", role: 1)
          movie_1 = Movie.create(title:"something good", description:"some eoetingd")
          movie_2 = Movie.create(title:"something else", description:"a movie about a movie")
          award_1 = Award.create(title: "best picture", movie: movie_1)
          award_2 = Award.create(title: "best actor", movie: movie_2 )
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

          visit admin_awards_path

          click_link("Create new award")

          expect(page).to have_content("Title")
          expect(page).to have_button("Create Award")

          fill_in("Title", with:"best of something")
          fill_in("Movie", with:"something good")

          click_button("Create Award")

          save_and_open_page





        end
      end
