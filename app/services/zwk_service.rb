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
    get_url("/recipes/#{recipe_id}")
  end

  def create_cooked_recipe(params)
    post_url("/api/v1/user/:user_id/recipes/:recipe_id")
  end
  
  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def save_ingredients(params)
    post_url(url: "/api/v1/user/:user_id/recipes/:recipe_id", params: JSON.generate(SavedIngredientsSerializer.new(params)))
  end

  def post_url(url)
    conn_post.post(url)
  end

  def conn_post
    Faraday.new(url: "http://localhost:3000/api/v1/") do |faraday|
      faraday.headers['Content-Type: '] = 'application/json'
    end
  end

  def conn
    Faraday.new(url: "http://localhost:3000/api/v1/")
  end
end
