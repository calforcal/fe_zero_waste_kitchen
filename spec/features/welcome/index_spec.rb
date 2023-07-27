require "rails_helper"

RSpec.describe "landing page", type: :feature do
  describe "when I visit the landing page" do
    it "I see a header and three links and a nav bar" do
      visit root_path

      expect(page).to have_content("Welcome To Zero Waste Kitchen")
      expect(page).to have_button("Login")
      expect(page).to have_button("Sign Up")
      expect(page).to have_button("Search Recipes")
    end
  end
end