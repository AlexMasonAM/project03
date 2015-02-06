class TruckAccountsController < ApplicationController

  def show
    @truck_account = TruckAccount.find(params[:id])
  end

  def new
    @truck_account = TruckAccount.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end