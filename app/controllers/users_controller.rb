class UsersController < ApplicationController
  before_action :require_login, only: :show

  def show

  end
end
