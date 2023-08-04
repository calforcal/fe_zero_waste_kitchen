class ZwkService

  def search_recipe_name(params)
    get_url("recipes/search?search=#{params}")
  end

  def search_recipe_ingredients(params)
    get_url("recipes/search?ingredients=#{params}")
  end

  def get_user_cookbook(user_uid)
    stuff = get_url("users/#{user_uid}")
  end

  def get_recipe_info(recipe_id)
    get_url("recipes/#{recipe_id}")
  end
  def create_cooked_recipe(params)
    post_url("/api/v1/user/:user_id/recipes/:recipe_id")
  end

  def post_save_recipe(user_uid, recipe_id, data)
    post_url("recipes/#{user_uid}/recipes/#{recipe_id}", data)
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def save_recipe(uid, recipe, data)
    recipe_params = {
      uid: uid,
      recipe_id: recipe.id,
      api_id: recipe.api_id,
      cook_status: data[:cook_status],
      saved_status: data[:saved_status],
      num_stars: data[:num_stars]
    }
    conn_post.post "recipes/#{recipe.id}" do |req|
      req.body = JSON.generate(recipe_params)
    end
  end

  def save_ingredients(params, uid)
    ingredient_hashes = []
    params.each do |ingredient|
      ingr = Hash.new
      ingr[:ingredient_name] = ingredient.name
      ingr[:units] = ingredient.units
      ingr[:unit_type] = ingredient.unit_type
      ingredient_hashes << ingr
    end
    params = {
      uid: uid,
      ingredients: ingredient_hashes
    }
    conn_post.post "users/#{uid}/ingredients" do |req|
      req.body = JSON.generate(params)
    end
  end

  # def conn_post
  #   Faraday.new(url: "https://be-zero-waste-kitchen.onrender.com/api/v1/") do |faraday|
  #     faraday.headers['Content-Type'] = 'application/json'
  #     faraday.params['zwk_api_key'] = ENV['ZWK_API_KEY']
  #   end
  # end

  # def conn
  #   Faraday.new(url: "https://be-zero-waste-kitchen.onrender.com/api/v1/") do |faraday|
  #     faraday.params['zwk_api_key'] = ENV['ZWK_API_KEY']
  #   end
  # end

  def conn_post
    Faraday.new(url: "http://localhost:5000/api/v1/") do |faraday|
      faraday.headers['Content-Type'] = 'application/json'
      faraday.params['zwk_api_key'] = ENV['ZWK_API_KEY']
    end
  end

  def conn
    Faraday.new(url: "http://localhost:5000/api/v1/") do |faraday|
      faraday.params['zwk_api_key'] = ENV['ZWK_API_KEY']
    end
  end
end
