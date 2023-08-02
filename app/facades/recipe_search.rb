class RecipeSearch

  def initialize(params = {})
    @recipe_id = params[:id]
    @name = params[:search]
    @ingredients = params[:ingredients]
  end

  def service
    ZwkService.new
  end

  def search_recipe_by_name
    recipes = service.search_recipe_name(@name)
    recipes[:data]&.map do |recipe|
      Recipe.new(id: recipe[:id],
                name: recipe[:attributes][:name],
                api_id: recipe[:attributes][:api_id])
    end
  end
  
  def search_recipes_by_ingredients
    recipes = service.search_recipe_ingredients(@ingredients)
    recipes[:data]&.map do |recipe|
      Recipe.new(id: recipe[:id],
                name: recipe[:attributes][:name],
                api_id: recipe[:attributes][:api_id])
    end
  end
end