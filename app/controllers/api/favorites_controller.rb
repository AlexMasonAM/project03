class Api::FavoritesController < ApplicationController
  def index
    favorites = Favorite.all
    render json: favorites,
                 include: [:truck, :user]
  end
end