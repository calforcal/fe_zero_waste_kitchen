require "rails_helper"

RSpec.describe ZwkService do
  describe "instance methods" do
    context "#get_user_cookbook" do
      it "returns the user's cookbook data" do
        user = create(:user)

        cookbook = ZwkService.new.get_user_cookbook(user.uid)
      
        expect(cookbook).to be_an(Hash)
      
        data = cookbook[:data]
      
        expect(data).to have_key(:id)
        expect(data[:id]).to be_a(String)

        expect(data).to have_key(:type)
        expect(data[:type]).to be_a(String)
        expect(data[:type]).to eq('user')

        expect(data).to have_key(:attributes)
        expect(data[:attributes]).to be_a(Hash)

        attributes = data[:attributes]

        expect(attributes).to have_key(:uid)
        expect(attributes[:uid]).to be_a(String)

        expect(attributes).to have_key(:stats)
        expect(attributes[:stats]).to be_a(Hash)

        stats = attributes[:stats]

        expect(stats).to have_key(:kg_emissions_saved)
        expect(stats[:kg_emissions_saved]).to be_an(Float)

        expect(stats).to have_key(:recipes_cooked)
        expect(stats[:recipes_cooked]).to be_an(Integer)

        expect(stats).to have_key(:recipes_created)
        expect(stats[:recipes_created]).to be_an(Integer)
        
        expect(attributes).to have_key(:cooked_recipes)
        expect(attributes[:cooked_recipes]).to be_an(Array)
        # expect(attributes[:cooked_recipes][0]).to be_a(Recipe)


        expect(attributes).to have_key(:created_recipes)
        expect(attributes[:created_recipes]).to be_an(Array)
        # expect(attributes[:created_recipes][0]).to be_a(Recipe)


        expect(attributes).to have_key(:saved_recipes)
        expect(attributes[:saved_recipes]).to be_an(Array)
        # expect(attributes[:saved_recipes][0]).to be_a(Recipe)

        expect(attributes).to have_key(:num_cooked_recipes)
        expect(attributes[:num_cooked_recipes]).to be_an(Integer)

        expect(attributes).to have_key(:num_created_recipes)
        expect(attributes[:num_created_recipes]).to be_an(Integer)

        expect(attributes).to have_key(:num_saved_recipes)
        expect(attributes[:num_saved_recipes]).to be_an(Integer)
      end
    end
  end
end