class Listing < ApplicationRecord
  belongs_to :car
  belongs_to :profile
  belongs_to :modification
end
