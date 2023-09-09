class InventoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @inventory_list = Inventory.includes(:foods, :inventory_foods).all
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(inventory_params)
    @inventory.user = current_user
    return unless @inventory.save

    redirect_to root_path
  end

  def add_selected_foods
    @inventory = Inventory.find(params[:id]) # Get the inventory
    food_id = params[:food_id]
    quantity = params[:food_quantity]

    # Handle adding the food to the inventory here, for example:
    if food_id.present? && quantity.to_i.positive?
      food = Food.find(food_id)
      inventory_food = InventoryFood.find_or_initialize_by(inventory: @inventory, food:)
      inventory_food.quantity += quantity.to_i

      if inventory_food.save
        flash[:success] = "#{quantity} #{food.name}(s) added to the inventory."
      else
        flash[:alert] = "Failed to add #{food.name}(s) to the inventory."
      end
    else
      flash[:alert] = 'Please select a food and enter a valid quantity.'
    end

    redirect_to inventory_path(@inventory)
  end

  def show
    @inventory = Inventory.find(params[:id])
    @all_interfaces = @inventory.inventory_foods
  end

  def all_names_with_ids
    inventories = Inventory.select(:id, :name).all
    render json: inventories
  end

  def destroy
    @inventory_item = Inventory.find(params[:id])

    return unless @inventory_item.destroy

    redirect_to inventories_path
  end

  def user_inventories
    @user_inventories = Inventory.where(user: current_user)
    render json: @user_inventories.select(:id, :name)
  end

  private

  def inventory_params
    params.require('inventory').permit(:name, :description)
  end
end
