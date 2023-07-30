require "rails_helper"

RSpec.describe "landing page", type: :feature do
  describe "when I visit the landing page as a new or logged-out user" do
    it "I see the webpage under visitor settings" do
      visit root_path

      expect(page).to have_css(".navbar.navbar-expand-sm")
      
      within(".navbar.navbar-expand-sm") do
        expect(page).to have_link("Kitchen")
        expect(page).to have_link("Search")
        expect(page).to_not have_link("Log Out")
      end

      expect(page).to have_css(".title-text.text-center.pt-5")

      within(".title-text.text-center.pt-5") do 
        expect(page).to have_content("Welcome To Zero Waste Kitchen")
      end
      
      expect(page).to have_css(".btn-group-toggle.text-center")

      within(".container.btn-group-toggle.text-center") do
        expect(page).to have_link("Login")
        expect(page).to have_link("Sign Up")
        expect(page).to have_link("Search Recipes")
        expect(page).to_not have_link("Your Kitchen")
      end
    end

    describe "navbar" do 
      it "the 'Kitchen' link routes to the landing page" do
      visit root_path
  
      click_on "Kitchen"
      expect(current_path).to eq(root_path)
      ### POTENTIAL ISSUE - MJ And I see a message that I must be a logged in registered user to access the Kitchen (users#show or Dashboard page). AKA PAY $5.99 a month!!!
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
      expect(current_path).to eq(new_user_registration_path)
      end

      it "the 'Search Recipes' button routes to the Search page" do
      visit root_path
  
      click_on "Search Recipes"
      expect(current_path).to eq(search_index_path)
      end
    end
  end

  describe "when I visit the landing page as a logged-in user" do
    it "I see the webpage with registered user details" do
      # FIRST NEED TO LOGIN HERE # current_user = 
      user = FactoryBot.create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      # require 'pry'; binding.pry
      visit root_path
      # save_and_open_page
      expect(page).to have_css(".navbar.navbar-expand-sm")
      
      within(".navbar.navbar-expand-sm") do
        expect(page).to have_link("Kitchen")
        expect(page).to have_link("Search")
        expect(page).to have_link("Logout")
      end

      expect(page).to have_css(".title-text.text-center.pt-5")

      within(".title-text.text-center.pt-5") do 
        expect(page).to have_content("Welcome To Zero Waste Kitchen")
      end
      
      expect(page).to have_css(".btn-group-toggle.text-center")

      within(".container.btn-group-toggle.text-center") do
        expect(page).to have_link("Your Kitchen")
        expect(page).to have_link("Search Recipes")

        expect(page).to_not have_link("Login")
        expect(page).to_not have_link("Sign Up")
      end
    end
  end
end