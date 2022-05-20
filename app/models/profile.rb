class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :address, dependent: :destroy
  has_many :listings
  has_many :watch_lists
  has_many :buyer_purchases, class_name: 'Purchase', foreign_key: 'buyer_id'
  has_many :seller_purchases, class_name: 'Purchase', foreign_key: 'seller_id'
  has_many :buyer_chats, class_name: 'Chat', foreign_key: 'buyer_id'
  has_many :seller_chats, class_name: 'Chat', foreign_key: 'seller_id'
  has_many :messages
  validates_associated :user
  accepts_nested_attributes_for :address
  validates :first_name, :last_name, :date_of_birth, presence: true
  validates :first_name, :last_name, length: { in: 3..50 }
  has_one_attached :avatar
end
