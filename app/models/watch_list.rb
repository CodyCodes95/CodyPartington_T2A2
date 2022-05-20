class WatchList < ApplicationRecord
  belongs_to :listing
  belongs_to :profile
  validates :listing_id, :profile_id, presence:true
end
