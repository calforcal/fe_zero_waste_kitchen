require 'webmock'
include WebMock::API

WebMock.enable!

require "rails_helper" 

RSpec.describe "Recipe Search", type: :feature do 
  describe "search by name" do 
    it "can search by name of recipe and see results" do 
      name_search = File.read('spec/fixtures/name_search.json')
      stub_request(:get, "http://localhost:5000/api/v1/recipes/search?search=tomato")
        .with(
          headers: {
            'Accept' => '*/*',
            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent' => 'Faraday v2.7.9'
          }
        )
        .to_return(status: 200, body: name_search, headers: {})
      visit search_index_path

      find(id: "recipeNameInput").fill_in with: "tomato"
      find(:button, id: "nameSearchButton").click
      
      save_and_open_page
      expect(current_path).to eq(search_index_path)
      within("#results") do 
        expect(page).to have_content("Tomato Cutlets")
        expect(page).to have_content("Tomato Stack Salad")
      end
    end
  end
end