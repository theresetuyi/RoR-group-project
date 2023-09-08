class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params2)

    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      render :new
    end
  end

  def update_status
    @recipe = Recipe.find(params[:id])
    if @recipe.public == true
      @recipe.public = false
    else
      @recipe.public = true
    end
    @recipe.save
    redirect_to @recipe, notice: "Status updated successfully."
  end

  def remove_food
    @recipe = Recipe.find(params[:id])
    @recipe_food = @recipe.recipe_foods.find(params[:recipe_food_id])

    if @recipe_food.destroy
      flash[:notice] = "Food removed successfully."
    else
      flash[:alert] = "Error removing food from the recipe."
    end

    redirect_to recipe_path(@recipe)
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

  # app/controllers/recipes_controller.rb
  def add_selected_foods
    selected_food_id = params[:food_id]
    quantity = params[:food_quantity].to_i
    food = Food.find_by(id: selected_food_id)
    @recipe = Recipe.find(params[:id]) # Ensure the recipe is loaded

    if food.present? && quantity > 0
      # Create a new RecipeFood record and associate it with the recipe and food
      @recipe_food = @recipe.recipe_foods.build(food: food, quantity: quantity)

      if @recipe_food.save
        flash[:notice] = "Food added successfully."
      else
        flash[:alert] = "Error adding food to the recipe."
      end
    else
      flash[:alert] = "Invalid food selection."
    end

    redirect_to recipe_path(@recipe)
  end

  def select_foods
    @recipe = Recipe.find(params[:id])
    @available_foods = Food.all # Modify this to retrieve the foods you want to display
  end

  def recipe_params
    params.require(:recipe).permit(
      recipe_foods_attributes: [:id, :food_id, :quantity, :_destroy]
    )
  end

  def recipe_params2
    params.require(:recipe).permit(:name, :description, :steps, :cooking_time, :preparation_time, :public)
  end
end
