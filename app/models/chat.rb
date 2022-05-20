class Chat < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :buyer, class_name: 'Profile'
  belongs_to :seller, class_name: 'Profile'
  belongs_to :listing
  validates :buyer_id, :seller_id, :listing_id, presence: true

  accepts_nested_attributes_for :messages
end
