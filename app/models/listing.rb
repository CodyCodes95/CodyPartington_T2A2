class Listing < ApplicationRecord
  belongs_to :car
  belongs_to :profile
  has_many :chats, dependent: :destroy
  has_many :listing_modifications, dependent: :destroy
  has_many :modifications, through: :listing_modifications
  has_many :watch_lists, dependent: :destroy
  has_many_attached :car_images
  accepts_nested_attributes_for :modifications, :car
  validates :price, :description, :year, :color, :car_images, presence:true
  validates :description, length: { in: 10..500 }
end
