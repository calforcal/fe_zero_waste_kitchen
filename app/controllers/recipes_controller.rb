class RecipesController < ApplicationController
  before_action :require_login, only: :new
  before_action :find_recipe_owner, only: :new

  def new

  end

  def show
    @recipe = ZwkFacade.new(recipe_id: params[:id]).recipe_show
  end
  
  def cook
    @recipe = ZwkFacade.new(recipe_id: params[:id]).recipe_show
    if params[:cooked]
      @new_recipe = @recipe.cook(params[:serving])
      ingredients = []
      @new_recipe.ingredients.each do |ingredient|
        if params[:ingredients].include?(ingredient.id.to_s)
          ingredients << ingredient
        end
      end
      ZwkService.new.save_ingredients(ingredients, @new_recipe.id, current_user.uid)
    end
  end

private
  def find_recipe_owner
    @user = User.find(params[:user_id])
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = "User not found."
    redirect_to root_path
  end
end