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
              :api_id

  def initialize(data)
    @name = data[:name]
    @id = data[:id]
    @instructions = data[:instructions]
    @image_url = data[:image_url]
    @cook_time = data[:cook_time]
    @public_status = data[:public_status]
    @source_name = data[:source_name]
    @source_url = data [:source_url]
    @user_submitted = data[:user_submitted]
    @api_id = data[:api_id]
  end
end