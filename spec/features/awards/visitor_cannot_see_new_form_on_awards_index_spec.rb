require 'rails_helper'

describe "visitor goes to awards index" do
  it "does not display new award form" do
    visit awards_path

    expect(page).to_not have_content('Name')
  end
end
