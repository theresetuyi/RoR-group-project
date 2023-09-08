class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food
  has_many :food, dependent: :destroy
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
