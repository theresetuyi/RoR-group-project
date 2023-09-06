class InventoriesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @inventory_list = Inventory.all
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
end
