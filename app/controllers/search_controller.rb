class SearchController < ApplicationController

  def index
    if params[:search]
      @recipes = ZwkFacade.new(params).search_recipe_by_name
    elsif params[:ingredients]
      @recipes = ZwkFacade.new(params).search_recipes_by_ingredients
    end
  end
end