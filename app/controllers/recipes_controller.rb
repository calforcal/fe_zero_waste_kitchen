class RecipesController < ApplicationController
  before_action :require_login, only: :new
  before_action :find_recipe_owner, only: :new

  def new; end

  def create

    #  require 'pry'; binding.pry
     ZwkService.new.post_url(url, params)
  end

  def show
    @recipe = ZwkFacade.new(recipe_id: params[:id]).recipe_show
    @facade = ZwkFacade.new(recipe_id: params[:id], id: current_user.id)
  end

private
  def find_recipe_owner
    @user = User.find(params[:user_id])
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = "User not found."
    redirect_to root_path
  end
end