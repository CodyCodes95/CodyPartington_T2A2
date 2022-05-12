class Listing < ApplicationRecord
  belongs_to :car
  belongs_to :profile
  has_many :listing_modifications, dependent: :destroy
  has_many :modifications, through: :listing_modifications
  has_many_attached :car_images
  accepts_nested_attributes_for :modifications, :car
  validates :price, :description, :year, :color, presence:true
end
