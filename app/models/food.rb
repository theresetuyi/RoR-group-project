class Food < ApplicationRecord
  has_and_belongs_to_many :inventory_foods
  has_and_belongs_to_many :recipe_foods
  validates :name, presence: true
  validates_uniqueness_of :name
  validates :measurement_unit, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
