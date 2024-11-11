class ParkingSpot < ApplicationRecord
  belongs_to :car, optional: true

  scope :find_empty, -> { where(car_id: nil).first }
end
