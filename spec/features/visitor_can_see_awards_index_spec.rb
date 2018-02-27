require "rails_helper"

describe "as a visitor" do
  before :each do
    @award1 = Award.create!(title: "the best")
    @award2 = Award.create!(title: "the worst")
  end
  describe "when i visit awards index" do
    it "shows all awards and not the form" do
      visit awards_path

      expect(page).to have_link(@award1.title)
      expect(page).to have_link(@award2.title)
      expect(page).to_not have_content("Create Award")
    end

    describe "award links" do
      it "links to that award show page" do
        visit awards_path

        click_on "the best"

        expect(page).to have_content("the best")
      end
    end
  end
end



# As an unregistered user,
# When I visit the awards index,
# I cannot see the form to create new awards,
# I see all awards (for testing purposes, I should see at least 2)
# and each award should be a link to that award's specific page
