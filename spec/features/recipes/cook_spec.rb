require "rails_helper" 

RSpec.describe "Cook a Recipe", type: :feature do 
  describe "cook a recipe page" do 
    it "loads a recipe's attributes" do 
      visit "/recipes/5/cook" 
      save_and_open_page
    end

    it "on submit it calculates servings and send saved ingredients" do 

    end
  end
end