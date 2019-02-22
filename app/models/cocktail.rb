class Cocktail < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews

  validates :name, presence: true, uniqueness: true

  def get_average_stars(stars)
    total_stars = @cocktail.reviews.map { |s| s.stars.nil? ? 0 : s.stars }
    @average_stars = total_stars.inject { |sum, el| sum + el } / total_stars.count
  end
end
