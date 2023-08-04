class ZwkFacade

  def initialize(params=nil)
    if params[:id]
      @user_id = params[:id]
      @user_uid = User.find(@user_id).uid
    end
    @recipe_id = params[:recipe_id]
  end

  def service
    ZwkService.new
  end

  def user_stats
    user_info = service.get_user_cookbook(@user_uid)[:data][:attributes]
    [user_info[:stats][:recipes_created], user_info[:stats][:recipes_cooked], user_info[:stats][:kg_emissions_saved]]
  end

  def make_saved_recipes(json)
    recipes = json[:data][:attributes][:saved_recipes]
    stuff = recipes.map do |recipe|
      Recipe.new(recipe)
    end
  end

  def make_created_recipes(json)
    recipes = json[:data][:attributes][:created_recipes]
    recipes.map do |recipe|
      Recipe.new(recipe)
    end
  end

  def make_cooked_recipes(json)
    recipes = json[:data][:attributes][:cooked_recipes]
    recipes.map do |recipe|
      Recipe.new(recipe)
    end
  end

  def saved_recipes
    make_saved_recipes(service.get_user_cookbook(@user_uid))
  end

  def created_recipes
    make_created_recipes(service.get_user_cookbook(@user_uid))
  end

  def cooked_recipes
    make_cooked_recipes(service.get_user_cookbook(@user_uid))
  end

  def recipe_show
    recipe = service.get_recipe_info(@recipe_id)
    Recipe.new(id: recipe[:data][:id],
              name: recipe[:data][:attributes][:name],
              instructions: recipe[:data][:attributes][:instructions],
              image_url: recipe[:data][:attributes][:image_url],
              cook_time: recipe[:data][:attributes][:cook_time],
              public_status: recipe[:data][:attributes][:public_status],
              source_name: recipe[:data][:attributes][:source_name],
              source_url: recipe[:data][:attributes][:source_url],
              user_submitted: recipe[:data][:attributes][:user_submitted],
              api_id: recipe[:data][:attributes][:api_id],
              ingredients: recipe[:data][:attributes][:ingredients].map do |ingredient|
                Ingredient.new(ingredient)
              end
              )
  end

  def is_saved_recipe(recipe_id)
    saved = []
    saved_recipes.each do |recipe|
      saved << recipe.id
    end
    saved.include?(recipe_id)
  end
end