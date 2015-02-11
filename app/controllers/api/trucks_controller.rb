class Api::TrucksController < ApplicationController

  def create
    truck = Truck.new(truck_params)
    if truck.save
      render json: truck
    else
      render json: {errors: truck.errors}, status: 422
    end
  end

  def index
    trucks = Truck.all
    render json: trucks,
           except: [:updated_at, :created_at, :truck_account_id],
           include: {
                    users: { except: [:password_digest, :created_at, :updated_at]}
                    } 

  end

  def show
    truck = Truck.find(params[:id])
    render json: truck,
            except: [:updated_at, :created_at, :truck_account_id],
           include: {
                    users: { except: [:password_digest, :created_at, :updated_at]}
                    } 
  end

  def update
    truck = Truck.find(params[:id])
    if truck.update(truck_params)
      render json: truck
    else
      render json: {errors: truck.errors}, status: 422
    end
  end

  def destroy
    truck = Truck.find(params[:id])
    if truck.destroy
      render json: truck, status: 200
    else
      render json: truck, status: 400
    end
  end

  private

  def truck_params
    params.require(:truck).permit(:id, :name, :genre, :twitter_handle, :yelp_id, :yelp_rating, :tweet_most_recent, :truck_account_id)
  end
end
