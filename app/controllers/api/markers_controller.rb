class Api::MarkersController < ApplicationController
  def index
    markers = Marker.all
    render json: markers
  end
end