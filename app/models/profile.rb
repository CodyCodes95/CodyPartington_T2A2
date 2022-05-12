class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :address, dependent: :destroy
  has_many :listings
  validates_associated :user
  accepts_nested_attributes_for :address
  validates :first_name, :last_name, :date_of_birth, presence: true
  validates :first_name, :last_name, length: { in: 3..50 }
  has_one_attached :avatar
end
