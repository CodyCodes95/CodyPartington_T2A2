class Car < ApplicationRecord
    has_many :listings
    has_many :purchases
    validates :make, :model, presence:true
end
