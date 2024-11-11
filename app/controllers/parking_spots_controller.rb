class ParkingSpotsController < ApplicationController
  def index
    @parking_spots = ParkingSpot.all
  end

  def show
  end

  def new
  end

  def create
    @parking_spot = ParkingSpot.new(number: params[:number])
    if @parking_spot.save
      redirect_to root_path
    end
  end

  def update
  end

  def edit
  end

  def update
  end

  def destroy
    parking_spot = ParkingSpot.find(params[:id])
    parking_spot.destroy
    redirect_to parking_spots_path, notice: "Parking spot removed."
  end

  def park
    empty_spot = ParkingSpot.find_empty
    car = Car.create(license: params[:license], color: params[:color])
    if car.save
      empty_spot.update(car: car)
      redirect_to parking_spots_path
    end
  end
end
