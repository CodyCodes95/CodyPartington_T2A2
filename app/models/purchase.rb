class Purchase < ApplicationRecord
  belongs_to :car
  belongs_to :buyer, class_name: 'Profile'
  belongs_to :seller, class_name: 'Profile'
  validates :price, presence:true
end
