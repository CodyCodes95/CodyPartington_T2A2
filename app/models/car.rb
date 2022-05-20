class Car < ApplicationRecord
    has_many :listings
    has_many :purchases
    validates :make, :model, presence:true
    validates :make, :model, length: { in: 2..30 }
end
