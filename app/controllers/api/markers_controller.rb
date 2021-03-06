class Api::MarkersController < ApplicationController
  
  def index

    # only send back markers that have not expired
    # markers = Marker.where("end_time >= ?", Time.now)

    # for now, just return last 25 markers
    markers = Marker.all[-25..-1]

    render json: markers, 
           except: [:truck_id, :updated_at],
           include: {truck: {only: [:id, :name, :genre, :twitter_handle, :tweet_most_recent]}}
  end

  def show
    marker = Marker.find(params[:id])
    render json: marker,
           except: [:truck_id, :updated_at],
           include: {truck: {only: [:id, :name, :genre, :twitter_handle, :tweet_most_recent]}}
  end

  def create
    marker = Marker.new(marker_params)
    marker.truck_id = params[:truck_id]
    if marker.save
      render json: marker
    else
      render json: {errors: marker.errors}, status: 422
    end
  end

  private
    def marker_params
      params.require(:marker).permit(:latitude, :longitude, :address, :end_time)
    end

end


