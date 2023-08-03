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

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)

    # Possible Sad Path Solution
    # if response.success?
    #   # Attempt to parse JSON data
    #   begin
    #     JSON.parse(response.body, symbolize_names: true)
    #   rescue JSON::ParserError => e
    #     # If parsing fails, return an empty hash (or handle the error as needed)
    #     puts "JSON Parsing Error: #{e.message}"
    #     {}
    #   end
    # else
    #   # Handle unsuccessful response (e.g., 4xx or 5xx status codes)
    #   puts "HTTP Error: #{response.status}"
    #   {}
    # end
  end

  def conn
    Faraday.new(url: "http://localhost:5000/api/v1/")
  end
end