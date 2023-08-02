require 'rails_helper'

RSpec.describe 'Recipes' do
  describe 'Create a New Recipe' do
    it 'displays a form to create a new recipe' do
      within '.recipe-form' do
        expect(page).to have_field(:name)
        expect(page).to have_field(:instructions)
        expect(page).to have_field(:cook_time)
        expect(page).to have_field(:public_status)
        expect(page).to have_field(:source_name)
        expect(page).to have_field(:source_url)
        expect(page).to have_field(:image_url)
      end
    end
  end
end