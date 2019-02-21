class Ingredient < ApplicationRecord
  has_many :doses

  validates :name, presence: true, uniqueness: true

  NAMES = Ingredient.order(:name).all.map { |ingredient| [ingredient.name, ingredient.id] }
end
