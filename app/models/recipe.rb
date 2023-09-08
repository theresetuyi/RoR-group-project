class Recipe < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :recipe_foods, foreign_key: 'recipe_id', dependent: :destroy
  has_many :foods, through: :recipe_foods, dependent: :destroy
  accepts_nested_attributes_for :recipe_foods

  # Add validations for the Recipe attributes
  validates :name, presence: true
  validates :description, presence: true
  validates :steps, presence: true
  validates :cooking_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :preparation_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :public, inclusion: { in: [true, false] }

  # Define a method to add Recipe Foods
  def add_recipe_food(food, quantity)
    recipe_foods.create(food: food, quantity: quantity)
  end
end