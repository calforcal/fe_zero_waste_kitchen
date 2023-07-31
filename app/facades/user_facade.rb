class UserFacade

  def initialize(params)
    @user_id = params[:id]
    @user_uid = User.find(@user_id).uid
  end

  def service
    UserService.new
  end

  def make_recipes(json)
    json[:data].map do |recipes|
      Recipe.new(recipes)
    end
  end

  def saved_recipes
    make_recipes(service.get_user_cookbook(@user_uid))
  end

  def create_user(params)
    service.create_user(params)
  end

end