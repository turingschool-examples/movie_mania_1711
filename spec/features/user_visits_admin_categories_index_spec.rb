require "rails_helper"

describe "as a reg user" do
  describe "when I visit the categories index" do
    it "I can see all the categories" do
      user = User.create!(username: "bOb", password: "password", role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_categories_path

      expect(page).to_not have_content("Admin Categories Path")
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
