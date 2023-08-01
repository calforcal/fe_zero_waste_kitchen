class ZwkService

  def search_recipe_name(params)
   get_url("recipes/search?search=#{params}")
  end
  
  def get_user_cookbook(user_uid)
    get_url("users/#{user_uid}")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "http://localhost:5000/api/v1/")
  end
end