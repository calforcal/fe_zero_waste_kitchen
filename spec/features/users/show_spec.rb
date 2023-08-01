require "rails_helper"

RSpec.describe "user/show page", type: :feature do
  describe "when I visit the user show page as a new or logged-out user" do
    it "rejects access" do
      user = FactoryBot.create(:user)
      
      visit user_path(user.id)

      expect(current_path).to eq(root_path)
      expect(page).to have_content("You must be logged in, to access the page you requested.")
    end

    it "rejects access if I request to see a user dashboard page for a user that does not exist" do 
      user = FactoryBot.create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit user_path(user.id)

      expect(current_path).to eq(user_path(user.id))

      fake_user_id = 100001192290392940349433434343434343
      visit user_path(fake_user_id)
      
      expect(current_path).to eq(root_path)
    end
  end

  describe "when I visit the user show page as a logged-in user" do
    it "allows access" do
      user = FactoryBot.create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit user_path(user.id)

      expect(current_path).to eq(user_path(user.id))

      expect(page).to have_css(".title-text.text-center.pt-5")

      within(".title-text.text-center.pt-5") do 
        expect(page).to have_content("#{user.name}'s Zero Waste Kitchen")
      end

      expect(page).to have_css(".container.btn-group-toggle.text-center")

      within(".container.btn-group-toggle.text-center") do 
        expect(page).to have_link("Search Recipes")
        expect(page).to have_link("Make your own Recipe")
      end

      expect(page).to have_css(".container-fluid.cookbook-title")

      within(".container-fluid.cookbook-title") do 
        expect(page).to have_content("#{user.name}'s Cookbook")
      end

    end
  end
end











