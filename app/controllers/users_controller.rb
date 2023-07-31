class UsersController < ApplicationController
  before_action :require_login, only: :show
  before_action :find_user, only: :show

  def show
    # require 'pry'; binding.pry
    @facade = UserFacade.new(params)
  end

  # def create
  #   user_facade = UserFacade.new
  #   # require 'pry'; binding.pry
  #   new_user_params = { }

  #   # Create the user using the facade
  #   user_facade.create_user(new_user_params)

  #   redirect_to user_path(@user.id)
  # end
end
