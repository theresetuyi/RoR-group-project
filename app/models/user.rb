class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :inventories, dependent: :destroy

  has_many :recipes, foreign_key: 'user_id', dependent: :destroy

  validates :name, presence: true
end
