class InventoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @inventory_list = Inventory.all
  end
end
