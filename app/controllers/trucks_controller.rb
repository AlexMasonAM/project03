class TrucksController < ApplicationController

  def index
    @trucks = Truck.all
  end

  def show
    @truck = Truck.find(params[:id])
  end

  def create
    @truck = Truck.new(truck_params)
    @truck.truck_account = TruckAccount.find(params[:truck_account_id])

    if @truck.save
      flash[:success] = "Truck saved successfully"
    else
      flash[:danger] = @truck.errors.full_messages.to_sentence
    end
    redirect_to new_truck_account_path
  end

  def update
    @truck = Truck.find(params[:id])
    @truck.update(truck_params)

    if @truck.save
      flash[:success] = "Truck saved successfully"
    else
      flash[:danger] = @truck.errors.full_messages.to_sentence
    end
    redirect_to edit_truck_account_path(params[:truck_account_id])
  end

  private
    def truck_params
      params.require(:truck).permit(:name, :genre, :twitter_handle, :yelp_id, :yelp_ratings, :tweet_most_recent)
    end

end