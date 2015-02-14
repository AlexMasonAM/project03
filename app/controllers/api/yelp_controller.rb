class Api::YelpController < ApplicationController
  def index
  end

  def search
    # parameters = { term: params[:term], limit: 1 }
    business = Yelp.client.business(params[:term]).to_json
    business = JSON.parse(business)
    date = business["reviews"][0]["time_created"]
    business["reviews"][0]["time_created"] = Time.at(date)
    render json: business
  end
end
