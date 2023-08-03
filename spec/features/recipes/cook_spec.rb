require "rails_helper" 

RSpec.describe "Cook a Recipe", type: :feature do 
  describe "cook a recipe page" do 
    it "loads a recipe's attributes" do 
      VCR.use_cassette('Cook_a_Recipe/cook_a_recipe_page/loads_a_recipe_s_attributes', match_requests_on: [:path]) do
        user = FactoryBot.create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit "/recipes/5/cook" 
        expect(page).to have_content("Chicken Parm")
        expect(page).to have_content("How many servings do you want to cook?")
        expect(page).to have_content("One Serving")
        expect(page).to have_content("Two Servings")
        expect(page).to have_content("Half Serving")
        expect(page).to have_content("Save from waste bin:")
        expect(page).to have_content("Chicken")
        expect(page).to have_content("Cheese")
        expect(page).to have_content("Ground beef")
        expect(page).to have_content("Ingredients")
        expect(page).to have_content("Chicken 2.0 lbs")
        expect(page).to have_content("ground beef 2.0 lbs")
        expect(page).to have_content("Instructions")
        expect(page).to have_content("1. Cook the chicken")
      end
    end
    
    xit "on submit it calculates servings and send saved ingredients" do
      VCR.use_cassette('Cook_a_Recipe/cook_a_recipe_page/on_submit_it_calculates_servings_and_send_saved_ingredients', match_requests_on: [:path]) do
        user = FactoryBot.create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit "/recipes/5/cook" 
        find("#serving_2").click
        find("#ingredients_13").click
        find("#ingredients_14").click
        click_button("Save")
        
        expect(current_path).to eq("/recipes/5/cook")
        expect(page).to have_content("Chicken 4.0 lbs")
        expect(page).to have_content("Cheese 1.0 lbs")
        expect(page).to have_content("eggs 4.0 oz")
      end
    end
  end
end