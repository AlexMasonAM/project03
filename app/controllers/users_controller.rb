class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation))

    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id]) 
  end

  def update
    @user = User.find(params[:id])

      @user.update(params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation))
    if @user.save
      redirect_to users_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    
    @user.destroy

    redirect_to users_path
  end
end
