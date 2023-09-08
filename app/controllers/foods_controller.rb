class FoodsController < ApplicationController
  before_action :authenticate_user!

  def new
    @inventory = Inventory.find(params[:inventory_id])
    @food = Food.new
    @available_foods = Food.all
  end

  def create
    @food = Food.new(food_params)
    @inventory = Inventory.find(params[:inventory_id])
    existing_food = Food.find_by(name: @food.name)

    if existing_food
      # Food with the same name already exists
      # You can handle this situation here, for example, by redirecting to the edit page
      redirect_to edit_inventory_food_inventory_food_path(@inventory, existing_food)
    elsif @food.save
      redirect_to new_inventory_food_inventory_food_path(@inventory, @food)
    else
      flash.now[:alert] = 'Error: Food with this name already exists.'
      render :new
    end
  end

  def destroy
    food_targeted = Food.find(params[:id])
    inventory = Inventory.find(params[:inventory_id])
    return unless food_targeted.destroy

    redirect_to inventory_path(inventory)
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
