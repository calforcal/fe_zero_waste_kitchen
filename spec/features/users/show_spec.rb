require "rails_helper"

RSpec.describe "user/show page", type: :feature do
  describe "when I visit the user show page as a new or logged-out user" do
    xit "rejects access" do
      user = FactoryBot.create(:user)
      
      visit user_path(user.id)

      expect(current_path).to eq(root_path)
      expect(page).to have_content("You must be logged in, to access the page you requested.")
    end

    xit "rejects access if I request to see a user dashboard page for a user that does not exist" do 
      user = FactoryBot.create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit user_path(user.id)

      expect(current_path).to eq(user_path(user.id))

      fake_user_id = 100001192290392940349433434343434343
      visit user_path(fake_user_id)
      
      expect(current_path).to eq(root_path)
    end
  end

  describe "when I visit the user show page as a logged-in user" do
    xit "allows access" do
      user = FactoryBot.create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit user_path(user.id)

      expect(current_path).to eq(user_path(user.id))

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
    end

    describe 'displays a my Cookbook section ' do
      it 'has a Recipes Saved where I see recipes a user has saved' do
        user = FactoryBot.create(:user, name: 'michael', email: 'michael@gmail.com', uid: '123')
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit user_path(user.id)

        expect(current_path).to eq(user_path(user.id))

        within '.container-fluid.recipes_saved' do
          expect(page).to have_link('Chicken Parm')
          expect(page).to have_link('Meatballs')

          click_link 'Chicken Parm'
          expect(current_path).to eq("/recipes/5")
        end
      end

      it 'has a From My Kitchen section where I see Recipes a User has made' do
        user = FactoryBot.create(:user, name: 'michael', email: 'michael@gmail.com', uid: '123')
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit user_path(user.id)

        expect(current_path).to eq(user_path(user.id))

        within '.container-fluid.recipes_created' do
          expect(page).to have_link('Chicken Parm')
          expect(page).to_not have_link('Meatballs')

          click_link 'Chicken Parm'
          expect(current_path).to eq("/recipes/5")
        end
      end

      it 'has a From My Kitchen section where I see Recipes a User has made' do
        user = FactoryBot.create(:user, name: 'michael', email: 'michael@gmail.com', uid: '123')
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit user_path(user.id)

        expect(current_path).to eq(user_path(user.id))

        within '.container-fluid.recipes_cooked' do
          expect(page).to_not have_link('Chicken Parm')
          expect(page).to have_link('Meatballs')

          click_link 'Meatballs'
          expect(current_path).to eq("/recipes/6")
        end
      end
    end

    describe 'Create A Recipe Section' do
      it 'has a section with a button that routes to page to create a new recipe' do
        user = FactoryBot.create(:user, name: 'michael', email: 'michael@gmail.com', uid: '123')
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit user_path(user.id)

        expect(current_path).to eq(user_path(user.id))

        within '.container.btn-group-toggle.text-center' do
          expect(page).to have_link("Make your own Recipe")
          click_link "Make your own Recipe"

          expect(current_path).to eq(new_user_recipe_path(user))
        end
      end
    end
  end
end











