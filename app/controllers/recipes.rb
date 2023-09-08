# app/controllers/recipes_controller.rb
class RecipesController < ApplicationController
  before_action :authenticate_user! # Add this line to require authentication

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      render :new
    end
  end

  # Other actions (show, edit, update, destroy) can be added as needed

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :steps, :cooking_time, :preparation_time, :status)
  end
end
