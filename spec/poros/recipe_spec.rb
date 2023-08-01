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
end