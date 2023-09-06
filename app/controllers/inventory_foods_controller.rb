class InventoryFoodsController < ApplicationController
  before_action :authenticate_user!

  def new
    @inventory = Inventory.find(params[:inventory_id])
    @food = Food.find(params[:food_id])
    @interface = InventoryFood.new
  end

  def create
    @food = Food.find(params[:food_id])
    @inventory = Inventory.find(params[:inventory_id])
    @quantity = params[:inventory_food][:quantity]
    @interface = InventoryFood.new(quantity: @quantity, food: @food, inventory: @inventory)
    if @interface.save
      redirect_to inventory_path(@inventory)
    else
      render 'new'
    end
  end
end
