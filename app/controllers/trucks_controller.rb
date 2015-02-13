class TrucksController < ApplicationController
  
  def show
    @truck = Truck.find(params[:id])
  end

  def new
    @truck = Truck.new
  end

  def create
    @truck = Truck.new(truck_params)
    @truck.truck_account_id = params[:truck_account_id]

    if @truck.save
      flash[:success] = "Truck added!"
      redirect_to truck_account_path(params[:truck_account_id])
    else
      flash[:danger] = @truck.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @truck = Truck.find(params[:id])
  end

  def update
    @truck = Truck.find(params[:id])
    if @truck.update(truck_params)
      flash[:success] = "Truck details updated successfully"
      redirect_to truck_account_path(params[:truck_account_id])
    else
      flash[:danger] = @truck.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @truck = Truck.find(params[:id])
    @truck.markers.destroy_all
    @truck.favorites.destroy_all
    @truck.destroy
    flash[:info] = "#{@truck.name} Truck deleted"
    redirect_to truck_account_path
  end

  private

  def truck_params
    params.require(:truck).permit(:name, :twitter_handle, :genre, :yelp_id)
  end

end