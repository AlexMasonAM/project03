class TruckAccountsController < ApplicationController

  def show
    @truck_account = TruckAccount.find(params[:id])
  end

  def new
    @truck_account = TruckAccount.new
  end

  def create
    @truck_account = TruckAccount.new(truck_account_params)
    if @truck_account.save
      redirect_to truck_account_trucks_path(@truck_account)
    else
      render :new
    end
  end

  def edit
    @truck_account = TruckAccount.find(params[:id])
  end

  def update
    @truck_account = TruckAccount.find(params[:id])
    @truck_account.update(truck_account_params)
    if @truck_account.save 
      redirect_to truck_account_trucks_path(@truck_account)
    else
      render :edit
    end
  end

  def destroy
    @truck_account = TruckAccount.find(params[:id])
    @truck_account.destroy
    redirect_to root_path
  end

  private
    def truck_account_params
      params.require(:truck_account).permit(:first_name, :last_name, :company, :email, :password, :password_confirmation)
    end
end