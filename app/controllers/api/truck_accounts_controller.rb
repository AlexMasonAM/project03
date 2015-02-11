class Api::TruckAccountsController < ApplicationController

  def index
    truck_accounts = TruckAccount.all
    render json: truck_accounts
  end

  def show
    truck_account = TruckAccount.find(params[:id])
    render json: truck_account
  end

  def create
    truck_account = TruckAccount.new(account_params)
    if truck_account.save
      render json: truck_account
    else
      render json: {errors: truck_account.errors}, status: 422
    end
  end

  def update
    truck_account = TruckAccount.find(params[:id])
    if truck_account.update(account_params)
      render json: truck_account
    else
      render json: {errors: truck_account.errors}, status: 422
    end
  end

  def destroy
    truck_account = TruckAccount.find(params[:id])
    if truck_account.destroy
      render json: truck_account, status: 200
    else
      render json: truck_account, status: 400
    end
  end

  private

  def account_params
    params.require(:truck_account).permit(:first_name, :last_name, :company, :email, :password, :password_confirmation)
  end

end
