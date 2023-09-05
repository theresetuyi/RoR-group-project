class AddFks < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :inventory, foreign_key: true
    add_reference :inventory_foods, :food, foreign_key: true
    add_reference :inventory_foods, :inventory, foreign_key: true
  end
end
