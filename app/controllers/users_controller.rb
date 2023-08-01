class UsersController < ApplicationController
  before_action :require_login, only: :show
  before_action :find_user, only: :show

  def show
    @facade = UserFacade.new(params)
  end
end
