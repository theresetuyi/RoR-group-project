class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

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

  def add_selected_foods
    @recipe = Recipe.find(params[:id])
    selected_food_ids = params[:food_ids]
    selected_foods = Food.where(id: selected_food_ids)

    @recipe.foods << selected_foods

    redirect_to recipe_path(@recipe), notice: 'Selected foods added to the recipe.'
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
end
