require "rails_helper" 

RSpec.describe "Recipe Search", type: :feature do 
  describe "search by name" do 
    it "can search by name of recipe and see results" do 
      visit search_index_path

      fill_in "#recipeNameInput", with: "potato"
      # click_button "Search"
      find(:button, id: "nameSearchButton").click
      
      save_and_open_page
      expect(current_path).to eq(search_index_path)
      expect(page).to have_content("Oven Potatoes")
      expect(page).to have_content("Old-Fashioned Potato Salad")
    end
  end
end