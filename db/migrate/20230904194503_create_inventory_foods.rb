class CreateInventoryFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :inventory_foods do |t|
      t.quantity :integer, default: 0
      t.timestamps
    end
  end
end
