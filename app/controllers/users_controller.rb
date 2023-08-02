class UsersController < ApplicationController
  before_action :require_login, only: :show
  before_action :find_user, only: :show

  def show
    @facade = ZwkFacade.new(params)
    require 'pry'; binding.pry
    
  end
end
