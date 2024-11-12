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

  def destroy
    parking_spot = ParkingSpot.find(params[:id])
    if parking_spot.car_id != nil
      car = Car.find(parking_spot.car_id)
      parking_spot.destroy
      car.destroy
    end
    redirect_to root_path
  end

  def park
    empty_spot = ParkingSpot.find_empty
    if !empty_spot.respond_to?("length")
      car = Car.create(license: params[:license], color: params[:color])
      if car.save
        empty_spot.update(car: car)
        redirect_to root_path
      end
    else
      redirect_to root_path, notice: "Parking lot full"
    end

  end

  def leave
    parking_spot = ParkingSpot.find(params[:id])
    if parking_spot.car_id != nil
      car = Car.find(parking_spot.car_id)
      parking_spot.update(car_id: nil)
      car.destroy
    end
    redirect_to root_path
  end
end
