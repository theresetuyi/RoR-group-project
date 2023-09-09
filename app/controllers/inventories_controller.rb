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

  def show
    @inventory = Inventory.find(params[:id])
    @all_interfaces = @inventory.inventory_foods
  end

  def destroy
    @inventory_item = Inventory.find(params[:id])

    return unless @inventory_item.destroy

    redirect_to inventories_path
  end

  private

  def inventory_params
    params.require('inventory').permit(:name, :description)
  end
end
