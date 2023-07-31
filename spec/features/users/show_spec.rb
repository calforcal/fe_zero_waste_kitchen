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

      # within(".navbar.navbar-expand-sm") do
      #   expect(page).to have_link("Kitchen")
      #   expect(page).to have_link("Search")
      #   expect(page).to_not have_link("Log Out")
      # end
    end
  end
end



### Move Back to app/views/users/show.html.erb line 19
# <div class="container-fluid recipes_saved ">
#   <h2 class="text-center">Saved Recipes</h2>
#   <ul>
#     <% @facade.saved_recipes.each do |recipe| %>
#       <li><%= link_to "#{recipe.name}", user_recipe_path(@user.id) %></li>
#     <% end %>
#   </ul>
# </div>










