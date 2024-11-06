class ParkingSpotsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
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
