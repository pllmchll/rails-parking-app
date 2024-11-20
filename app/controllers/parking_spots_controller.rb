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
    else
      parking_spot.destroy
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

  def find_license
    car = Car.find_by(license: params[:license])
    
    if car && car.parking_spot
      spot = car.parking_spot.number
      flash[:car_search_result] = "#{params[:license]} license found at: #{spot}"
    else
      flash[:car_search_result] = "#{params[:license]} license not found"
    end
    redirect_to root_path
  end

  def find_color
    
    cars = Car.where(color: params[:color])
    
    if cars.length > 0
      spots = cars.map { |car| car.parking_spot.number }
      flash[:car_search_result] = "#{params[:color]} cars found at: #{spots}"
    else
      flash[:car_search_result] = "#{params[:color]} cars not found"
    end
    redirect_to root_path
  end
end
