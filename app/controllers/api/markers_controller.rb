class Api::MarkersController < ApplicationController
  
  def index
    markers = Marker.all
    render json: markers, 
           except: [:id, :truck_id, :updated_at],
           include: {truck: {only: [:name, :genre, :twitter_handle, :tweet_most_recent]}}
  end

  def show
    marker = Marker.find(params[:id])
    render json: marker,
           except: [:id, :truck_id, :updated_at],
           include: {truck: {only: [:name, :genre, :twitter_handle, :tweet_most_recent]}}
  end

  def create
    marker = Marker.new(marker_params)
    if marker.save
      render json: marker
    else
      render json: {errors: marker.errors}, status: 422
    end
  end

end


