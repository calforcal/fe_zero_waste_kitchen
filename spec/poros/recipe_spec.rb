require 'rails_helper'

RSpec.describe Recipe do
  describe "#initialize" do 
    it "exists and has attributes" do 
      attrs = { 
        name: "Chicky Parm",
        instructions: ["1. Turn on oven, 2. Mix all together, 3. Put in Oven, 4. Take out and enjoy"],
        image_url: "www.sweetimages.com/images/chickenparmesan",
        cook_time: "60",
        public_status: "true",
        source_name: "Chef Mateo",
        source_url: "www.chefmateo.com",
        user_submitted: "true",
        api_id: "10"
        }
    
      recipe = Recipe.new(attrs)
    
      expect(recipe).to be_a(Recipe)
    
      expect(recipe.name).to eq("Chicky Parm")
      expect(recipe.instructions).to eq(["1. Turn on oven, 2. Mix all together, 3. Put in Oven, 4. Take out and enjoy"])
      expect(recipe.image_url).to eq("www.sweetimages.com/images/chickenparmesan")
      expect(recipe.cook_time).to eq("60")
      expect(recipe.public_status).to eq("true")
      expect(recipe.source_name).to eq("Chef Mateo")
      expect(recipe.source_url).to eq("www.chefmateo.com")
      expect(recipe.user_submitted).to eq("true")
      expect(recipe.api_id).to eq("10")
    end
  end

  describe "instance methods" do 
    before(:each) do 
      @chicken = Ingredient.new(name: 'Chicken', units: 2.0, unit_type: 'lbs')
      @cheese = Ingredient.new(name: 'Cheese', units: 0.5, unit_type: 'lbs')
      @ground_beef = Ingredient.new(name: 'ground beef', units: 2.0, unit_type: 'lbs')
      ingredients = [@chicken, @ground_beef, @cheese]
      @recipe_1 = Recipe.new(name: 'Chicken Parm', api_id: "646660", ingredients: ingredients, instructions: "1. Cook the chicken,2. Cover in sauce and cheese,3. Enjoy!", image_url: 'pic of my chicken parm', cook_time: 45, public_status: true, image_url: "sweet_url", source_name: "name", source_url: "/api/v1/users/userid")
    end

    it "#cook" do 
      @recipe_1.cook("0.5")

      expect(@recipe_1.ingredients[0].units).to eq(1.0)
      expect(@recipe_1.ingredients[2].units).to eq(0.25)
      expect(@recipe_1.ingredients[1].units).to eq(1.0)
    end
  end
end