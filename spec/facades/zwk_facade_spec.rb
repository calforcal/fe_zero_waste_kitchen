require "rails_helper"

RSpec.describe ZwkFacade do
  describe "recipes" do 
    before(:each) do 
      @recipe_1 = { 
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

        @recipe_2 = { 
          name: "Meatball Sub",
          instructions: ["1. Put meatballs in bread, 2. close sandwhich, 3. Enjoy"],
          image_url: "www.sweetimages.com/images/meatball_sub",
          cook_time: "10",
          public_status: "false",
          source_name: "Chef Mateo",
          source_url: "www.chefmateo.com",
          user_submitted: "true",
          api_id: "11"
          }
    end

    describe "#make_saved_recipes" do
      it "can list the user's saved recipes" do
        user = create(:user)
        params =  {
                    :data=>
                      { 
                      :id=>"13",
                      :type=>"user",
                      :attributes=>
                        {
                          :uid=>"cf31d467-7ccc-458b-b3de-7967f15fcad8",
                          :stats=>{:recipes_created=>0, :recipes_cooked=>0, :kg_emissions_saved=>0.0},
                          :cooked_recipes=>[@recipe_2],
                          :created_recipes=>[],
                          :saved_recipes=>[@recipe_1],
                          :num_cooked_recipes=>0,
                          :num_created_recipes=>0,
                          :num_saved_recipes=>0
                        }
                      }
                  }
        
        user_params = {id: user.id}
        saved_recipes = ZwkFacade.new(user_params).make_saved_recipes(params)

        expect(saved_recipes).to be_an(Array)
        expect(saved_recipes.count).to eq(1)

        saved_recipes.each do |recipe|
          expect(recipe).to be_a(Recipe)
        end
      end
    end

    describe "#make_created_recipes" do
      it "can list the user's saved recipes" do
        user = create(:user)
        params =  {
                    :data=>
                      { 
                      :id=>"13",
                      :type=>"user",
                      :attributes=>
                        {
                          :uid=>"cf31d467-7ccc-458b-b3de-7967f15fcad8",
                          :stats=>{:recipes_created=>0, :recipes_cooked=>0, :kg_emissions_saved=>0.0},
                          :cooked_recipes=>[],
                          :created_recipes=>[@recipe_2],
                          :saved_recipes=>[],
                          :num_cooked_recipes=>0,
                          :num_created_recipes=>0,
                          :num_saved_recipes=>0
                        }
                      }
                  }
        
        user_params = {id: user.id}
        created_recipes = ZwkFacade.new(user_params).make_created_recipes(params)

        expect(created_recipes).to be_an(Array)
        expect(created_recipes.count).to eq(1)

        created_recipes.each do |recipe|
          expect(recipe).to be_a(Recipe)
        end
      end
    end

    describe "#make_created_recipes" do
      it "can list the user's saved recipes" do
        user = create(:user)
        params =  {
                    :data=>
                      { 
                      :id=>"13",
                      :type=>"user",
                      :attributes=>
                        {
                          :uid=>"cf31d467-7ccc-458b-b3de-7967f15fcad8",
                          :stats=>{:recipes_created=>0, :recipes_cooked=>0, :kg_emissions_saved=>0.0},
                          :cooked_recipes=>[@recipe_2],
                          :created_recipes=>[],
                          :saved_recipes=>[],
                          :num_cooked_recipes=>0,
                          :num_created_recipes=>0,
                          :num_saved_recipes=>0
                        }
                      }
                  }
        
        user_params = {id: user.id}
        cooked_recipes = ZwkFacade.new(user_params).make_cooked_recipes(params)

        expect(cooked_recipes).to be_an(Array)
        expect(cooked_recipes.count).to eq(1)

        cooked_recipes.each do |recipe|
          expect(recipe).to be_a(Recipe)
        end
      end
    end
  end
end