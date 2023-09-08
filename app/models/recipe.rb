class Recipe < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :recipe_foods, foreign_key: 'recipe_id', dependent: :destroy

  validates :description, presence: true
  validates :name, presence: true
end
