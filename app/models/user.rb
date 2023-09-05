class User < ApplicationRecord
  has_many :inventories, dependent: :destroy
  validates :name, presence: true
end
