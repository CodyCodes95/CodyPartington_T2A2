class Purchase < ApplicationRecord
  belongs_to :car
  belongs_to :buyer
  belongs_to :seller
end
