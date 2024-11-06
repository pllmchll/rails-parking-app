class CreateParkingSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :parking_spots do |t|
      t.string :number
      t.references :car, null: false, foreign_key: true

      t.timestamps
    end
  end
end
