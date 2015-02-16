class Api::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: {errors: user.errors}, status: 422
    end
  end

  def index
    users = User.all
    render json: users,
           except: [:updated_at, :created_at, :password_digest],
           include: {
                    trucks: {except: [:created_at, :updated_at]},
                    }
  end

  def show
    user = User.find(params[:id])
    render json: user,
           except: [:updated_at, :created_at, :password_digest],
           include: {
                    trucks: {except: [:created_at, :updated_at]},
                    favorites: {except: [:created_at, :updated_at]}
                    }
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user
    else
      render json: {errors: user.errors}, status: 422
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      render json: user, status: 200
    else
      render json: user, status: 400
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :email, :yelp_id, :password, :password_confirmation)
  end
end

