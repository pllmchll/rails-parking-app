class ParkingSpotsController < ApplicationController
  def index
    @parking_spots = ParkingSpot.all
    @parking_spot = ParkingSpot.new
  end

  def show
  end

  def new
  end

  def create
    @parking_spot = ParkingSpot.new(parking_spot_params)
    if @parking_spot.save
      redirect_to parking_spots_path
    end
  end

  def update
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def parking_spot_params
      params.require(:parking_spot).permit(:number)
    end
end
