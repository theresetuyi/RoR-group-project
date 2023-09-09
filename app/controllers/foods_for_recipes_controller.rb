class FoodsForRecipesController < ApplicationController
  before_action :set_recipe, only: [:create]
  def create
    @food = Food.new(food_params)

    if @food.save
      flash[:notice] = 'Food added successfully.'
      redirect_to select_foods_recipe_path(@recipe)
    else
      flash[:alert] = 'Food creation failed.'
      redirect_back(fallback_location: select_foods_recipe_path(@recipe), alert: 'Food creation failed.')
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
