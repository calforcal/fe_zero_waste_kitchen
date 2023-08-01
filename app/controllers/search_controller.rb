class SearchController < ApplicationController

  def index
    #  require 'pry'; binding.pry
    # Get the search query from the params (assuming it's passed as 'search' parameter)
    # query = params[:search]

    # Call the facade function to search for recipes
    # @recipes = KitchenFacade.search_recipes(query)
    
    if params[:search]
      @recipes = ZwkFacade.new(params).search_recipe_by_name
    elsif params[:ingredients]
      @recipes = ZwkFacade.new(params).search_recipes_by_ingredients
    end
  end
end