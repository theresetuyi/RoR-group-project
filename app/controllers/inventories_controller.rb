class InventoriesController < ApplicationController
  def index
    @inventory_list = Inventory.all
  end
end
