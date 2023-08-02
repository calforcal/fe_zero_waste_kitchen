class ZwkFacade

  def initialize(params = {})
    @user_id = params[:id]
    @user_uid = params[:uid]
    @name = params[:search]
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
    recipes.map do |recipe|
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
end