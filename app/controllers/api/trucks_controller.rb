class Api::TrucksController < ApplicationController

  def index
    trucks = Truck.all
    render json: trucks
  end
end