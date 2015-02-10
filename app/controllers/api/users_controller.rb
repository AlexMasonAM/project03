class Api::UsersController < ApplicationController

  def create
    user = User.new(post_params)
    if user.save
      render json: user
    else
      render json: {errors: user.errors}, status: 422
    end
  end

  def index
    users = User.all
    render json: users,
           except: [:updated_at, :created_at, :password_digest, :id],
           include: {
                    # favorites: { except: []}, 
                    trucks: {except: [:created_at, :updated_at]},
                    # preference_list: {except: []}
                    }
  end

  def show
    user = User.find(params[:id])
    render json: user,
           except: [:updated_at, :created_at, :password_digest, :id],
           include: {
                    # favorites: { except: []}, 
                    trucks: {except: [:created_at, :updated_at]},
                    # preference_list: {except: []}
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
    params.require(:user).permit(:id, :first_name, :last_name, :email, :password_digest, :yelp_id)
  end
end





# class UsersController < ApplicationController
#   def new
#     @user = User.new
#   end

#   def create
#     @user = User.new(params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation))

#     if @user.save
#       redirect_to users_path
#     else
#       render :new
#     end
#   end

#   def edit
#     @user = User.find(params[:id]) 
#   end

#   def update
#     @user = User.find(params[:id])

#       @user.update(params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation))
#     if @user.save
#       redirect_to users_path
#     else
#       render :edit
#     end
#   end

#   def show
#     @user = User.find(params[:id])
#   end

#   def index
#     @users = User.all
#   end

#   def destroy
#     @user = User.find(params[:id])
    
#     @user.destroy

#     redirect_to users_path
#   end
# end
