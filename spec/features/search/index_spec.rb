require "rails_helper" 

RSpec.describe "Recipe Search", type: :feature do 
  describe "search by name" do 
    it "can search by name of recipe and see results" do 
      visit search_index_path

      fill_in "recipeNameInput", with: "potato"
      click_button "Search" 

      expect(current_path).to eq(search_index_path)
      expect(page).to have_content("")
    end
  end
end