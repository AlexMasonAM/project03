class Api::MarkersController < ApplicationController
  def index
    markers = Marker.all
    render json: markers, 
           except: [:id, :truck_id, :updated_at],
           include: {truck: {only: [:name, :genre, :twitter_handle, :tweet_most_recent]}}
  end
end