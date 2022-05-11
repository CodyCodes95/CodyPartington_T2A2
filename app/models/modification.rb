class Modification < ApplicationRecord
    has_many :listing_modifications
    has_many :listings, through: :listing_modifications
end
