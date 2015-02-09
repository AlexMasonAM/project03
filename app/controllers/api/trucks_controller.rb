class Api::TrucksController < ApplicationController

  def index
    trucks = Truck.all

    render json: trucks
  end

  def show
    truck = Truck.find(params[:id])
    render json: truck
  end
end