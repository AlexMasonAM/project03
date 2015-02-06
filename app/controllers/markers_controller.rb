class MarkersController < ApplicationController
  
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

