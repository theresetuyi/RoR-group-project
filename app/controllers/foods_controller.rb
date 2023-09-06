class FoodsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @inventory = Inventory.find(params[:inventory_id])
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @inventory = Inventory.find(params[:inventory_id])
    # let to save, food is filled by data
    if @food.save
      redirect_to new_inventory_food_inventory_food_path(@inventory, @food)
    else
      render 'new'
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
