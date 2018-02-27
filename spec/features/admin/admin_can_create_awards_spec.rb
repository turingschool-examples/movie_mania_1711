require 'rails_helper'

describe "as an admin" do
  describe "when I visit the awards index" do
    describe "and click on link to create new award" do
      describe "and fill out form, then click submit" do
        before(:each) do
          @admin = create(:admin)
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
        end
        it "creates new award" do
          visit awards_path

          click_on "Create New Award"

          fill_in "award[title]", with: "Greatest Platypus this side of the Nile"
          click_on "Create Award"

          expect(page).to have_content(Award.first.title)
          expect(current_path).to have_content(awards_path)
        end
      end
    end
  end
end
