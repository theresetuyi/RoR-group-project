class InventFoodPk < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :inventories, :users
    add_foreign_key :inventory_foods, :inventories
    add_foreign_key :inventory_foods, :foods
  end
end
