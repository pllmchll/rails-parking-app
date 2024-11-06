class ParkingSpot < ApplicationRecord
  belongs_to :car, optional: true
end
