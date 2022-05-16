class Chat < ApplicationRecord
  belongs_to :message
  belongs_to :buyer
  belongs_to :seller
  belongs_to :listing
end
