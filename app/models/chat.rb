class Chat < ApplicationRecord
  has_many :messages
  belongs_to :buyer, class_name: 'Profile'
  belongs_to :seller, class_name: 'Profile'
  belongs_to :listing

accepts_nested_attributes_for :messages
end
