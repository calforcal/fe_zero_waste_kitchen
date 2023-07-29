require "rails_helper"

RSpec.describe "landing page", type: :feature do
  describe "when I visit the landing page as a new user" do
    it "I see the webpage with all its details" do
      visit root_path

      expect(page).to have_css(".navbar.navbar-expand-sm.navbar-dark.bg-dark")
      
      within(".navbar.navbar-expand-sm.navbar-dark.bg-dark") do
        expect(page).to have_link("Kitchen")
        expect(page).to have_link("Search")
      end

      expect(page).to have_css(".title.container-fluid.border.text-center")

      within(".title.container-fluid.border") do 
        expect(page).to have_content("Welcome To Zero Waste Kitchen")
      end
      
      expect(page).to have_css(".btn-group.d-flex.justify-content-center")

      within(".btn-group.d-flex.justify-content-center") do
        expect(page).to have_button("Login")
        expect(page).to have_button("Sign Up")
        expect(page).to have_button("Search Recipes")
      end
    end

    describe "navbar" do 
      it "the 'Kitchen' link routes to the landing page" do
      visit root_path
  
      click_on "Kitchen"
      expect(current_path).to eq(root_path)
      ### And I see a message that I must be a logged in registered user to access the Kitchen (users#show or Dashboard page). AKA PAY $5.99 a month!!!
      end

      it "the 'Search' link routes to the Search Recipes page" do
      visit root_path
  
      click_on "Search"
      expect(current_path).to eq(search_index_path)
      end
    end

    describe "buttons" do 
      it "the 'Login' button routes to the login page" do
      visit root_path
  
      click_on "Login"
      expect(current_path).to eq(new_user_session_path)
      end

      it "the 'Sign Up' button routes to the sign-up page" do
      visit root_path
  
      click_on "Sign Up"
      # require 'pry'; binding.pry
      expect(current_path).to eq(new_user_registration_path)

      end
    end
  end
end