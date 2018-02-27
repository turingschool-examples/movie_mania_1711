require 'rails_helper'    

describe "As a visitor" do
  describe "When I visit the awards index," do
    
    it "I fill out the form with the awards title" do
      admin = User.create(username: "Me", password: "pass", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    
      visit awards_path

      expect(page).to have_content("Awards")
      
      fill_in "award[title]", with: "M-E"

      click_on "Create Award"

      expect(page).to have_content("M-E")

    end

    it "I see the awards" do
      @user = User.create(username: "you", password: "pass", role: 0)
    
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    
      @user.awards.create(title: "Cool")
      @user.awards.create(title: "Hey")
    
      visit awards_path

      expect(page).to have_content("Awards")
      expect(page).to have_content("Cool")
      expect(page).to have_content("Hey")

    end

     it "I visit award show" do
      @user = User.create(username: "you", password: "pass", role: 0)
    
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    
      @user.awards.create(title: "Cool")
      @user.awards.create(title: "Hey")
    
      visit awards_path

      click_on "Cool"

      expect(page).to have_content("Award Show")
      expect(page).to have_content("Cool")

    end

    it "I visit award show" do
      @user = User.create(username: "you", password: "pass", role: 0)
    
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    
      director = Director.create(name: "Ilana")
      director.movies.create(title: "Guardians of the Galaxy", description: "Awesome", director_id: director)
      director.movies.create(title: "Avatar", description: "Blue people", director_id: director)
    
      visit director_movies_path(director)
      expect(page).to have_content("Guardians of the Galaxy")

      click_on "Guardians of the Galaxy"

      expect(current_path).to eq("/movies/guardians-of-the-galaxy")


    end

  end

end















