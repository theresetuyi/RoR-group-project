class InventoryFoodsController < ApplicationController
  before_action :authenticate_user!
end
