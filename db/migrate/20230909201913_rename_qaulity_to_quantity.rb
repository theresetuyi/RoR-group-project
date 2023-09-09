class RenameQaulityToQuantity < ActiveRecord::Migration[7.0]
  def change
    rename_column :recipe_foods, :quality, :quantity
  end
end
