class Recipe
  attr_reader :id,
              :name,
              :instructions,
              :image_url,
              :cook_time,
              :public_status,
              :source_name,
              :source_url,
              :user_submitted,
              :api_id,
              :ingredients

  def initialize(data)
    @name = data[:name]
    @id = data[:id].to_i
    @instructions = data[:instructions]
    @image_url = data[:image_url]
    @cook_time = data[:cook_time]
    @public_status = data[:public_status]
    @source_name = data[:source_name]
    @source_url = data [:source_url]
    @user_submitted = data[:user_submitted]
    @api_id = data[:api_id]
    @ingredients = data[:ingredients]
  end

  def cook(serving)
   new_recipe = ingredients.each do |ingredient|
      ingredient.units = (ingredient.units * serving.to_f)
    end
   new_recipe
  end
end