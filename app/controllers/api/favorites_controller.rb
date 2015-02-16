class Api::FavoritesController < ApplicationController

  def index
    favorites = Favorite.all
    render json: favorites
  end

  def show
    favorite = Favorite.find(params[:id])
    render json: favorite
  end

  def create
    favorite = Favorite.find_by(truck_id: params[:favorite][:truck_id], user_id: params[:favorite][:user_id])
    if favorite
      render json: favorite, status: 200
    else
      favorite = Favorite.create(params.require(:favorite).permit(:truck_id, :user_id))
      render json: favorite
    end
  end

  def destroy
    favorite = Favorite.find(params[:id])
    if favorite.destroy
      render json: favorite, status: 200
    else
      render json: favorite, status: 400
    end
  end

end 