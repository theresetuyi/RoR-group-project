class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    return unless @recipe.destroy

    redirect_to recipe_path
  end

  def public_recipes
    @recipes = Recipe.includes(:user).all.where(public: true).order(created_at: :desc)
  end

  def show
    @recipe = Recipe.find(params[:id])
    p @recipe.public
    @recipe_food = RecipeFood.includes(:food).all.where(recipe_id: @recipe.id)
    p @recipe_food
  end

  def add_food(recipe_id)
    @recipe = Recipe.find(recipe_id)
    @food = Food.find(params[:food_id])

    @recipe.foods << @food

    redirect_to recipe_path(@recipe)
  end
end
