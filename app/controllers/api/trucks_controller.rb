class Api::TrucksController < ApplicationController

  def index
    trucks = Truck.all
    render json: trucks,
                 include: [:users]
  end
end




# class TrucksController < ApplicationController

#   def index
#     if params[:truck_account_id]
#       @trucks = Truck.where(truck_account_id: params[:truck_account_id])
#     else
#       @trucks = Truck.all
#     end
#   end

#   def show
#     @truck = Truck.find(params[:id])
#   end

#   def create
#     @truck = Truck.new(truck_params)
#     @truck.truck_account = TruckAccount.find(params[:truck_account_id])

#     if @truck.save
#       flash[:success] = "Truck saved successfully"
#     else
#       flash[:danger] = @truck.errors.full_messages.to_sentence
#     end
#     redirect_to new_truck_account_path # or edit_truck_account_path(params[:truck_account_id])
#   end

#   def update
#     @truck = Truck.find(params[:id])
#     @truck.update(truck_params)

#     if @truck.save
#       flash[:success] = "Truck saved successfully"
#     else
#       flash[:danger] = @truck.errors.full_messages.to_sentence
#     end
#     redirect_to edit_truck_account_path(params[:truck_account_id])
#   end

#   def destroy
#     @truck = Truck.find(params[:id])
#     @truck.destroy
#     redirect_to new_truck_account_path # or edit_truck_account_path
#   end

#   private
#     def truck_params
#       params.require(:truck).permit(:name, :genre, :twitter_handle, :yelp_id, :yelp_ratings, :tweet_most_recent)
#     end

# end