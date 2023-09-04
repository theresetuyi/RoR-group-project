class InventoryFood < ApplicationRecord
  belongs_to: inventory
  belongs_to: food

  validates :quantity, greater_than_or_equal_to: 0
end
