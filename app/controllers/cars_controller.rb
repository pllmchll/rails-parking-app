class CarsController < ApplicationController
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
    def car_params
      params.require(:car).permit(:license, :color)
    end
end
