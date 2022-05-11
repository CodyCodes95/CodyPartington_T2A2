class Address < ApplicationRecord
    has_many :profiles
    validates :street_number, :street_name, :city, :state, :postcode, :country, presence:true
end
