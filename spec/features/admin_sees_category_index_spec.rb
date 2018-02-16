require "rails_helper"

describe "As an admin" do
  describe "when I visit the categories index" do
    it "I can see all the categories" do
      admin = User.create!(username: "bOb", password: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path

      expect(page).to have_content("Admin Categories Path")
    end
  end
end
