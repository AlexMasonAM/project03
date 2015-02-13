class Api::YelpController < ApplicationController
  def index
  end

  def search
    parameters = { term: params[:term], limit: 1 }
    render json: Yelp.client.business("los angeles")
  end
end
