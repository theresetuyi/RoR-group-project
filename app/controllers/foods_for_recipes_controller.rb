class FoodsForRecipesController < ApplicationController
  def create_for_recipe
    @food = Food.new(food_params)

    if @food.save
      redirect_to select_foods_recipe_path(@recipe)
    else
      # Redirect back to the previous page (select_foods)
      redirect_back(fallback_location: select_foods_recipe_path(@recipe), alert: "Food creation failed.")
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
