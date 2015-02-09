class MarkersController < ApplicationController
  
  def index
    markers = Marker.where("created_at >= ?", Time.now.beginning_of_day)

    json_data = []

    markers.each do |marker|
      json_data << {
        latitude: marker.latitude,
        longitude: marker.longitude,
        address: marker.address,
        end_time: marker.end_time,
        truck: marker.truck
      }
    end


    render json: json_data
  end


  def new
    @marker = Marker.new
  end

  def create
    @marker = Marker.new(params.require(:marker).permit(:latitude, :longitude, :address, :end_time))

    if @marker.save
      flash[:info] = "marker has been added to the map" 
      render :new
    else
      flash[:warning] = "marker wasn't added to the map"
      render :new
    end
  end
end

