class Review < ApplicationRecord
  belongs_to :cocktail

  validates :name, presence: true
  validates :content, presence: true

  STARS = (1..5).to_a
end
