class Car < ApplicationRecord
    has_many :listings
    validates :make, :model, presence:true
end
