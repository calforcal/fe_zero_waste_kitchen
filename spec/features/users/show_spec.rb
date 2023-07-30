require "rails_helper"

RSpec.describe "user/show page", type: :feature do
  describe "when I visit the user show page as a new or logged-out user" do
    it "rejects access" do
      user = FactoryBot.create(:user)
      visit user_path(user.id)

      expect(current_path).to eq(root_path)
      expect(page).to have_content("You must be logged in, to access the page you requested.")
    end
  end

  describe "when I visit the user show page as a logged-in user" do
    it "allows access" do
      user = FactoryBot.create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit user_path(user.id)

      expect(page).to have_content("HELLO")
      # within(".navbar.navbar-expand-sm") do
      #   expect(page).to have_link("Kitchen")
      #   expect(page).to have_link("Search")
      #   expect(page).to_not have_link("Log Out")
      # end
    end
  end
end
# <a class="nav-item nav-link navbar-brand text-dark" href="<%= search_index_path %>">Search</a>

