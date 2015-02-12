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
      session[:truck_id] = @truck_account.id.to_s
      redirect_to root_path
    else
      flash.now[:danger] = @truck_account.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @truck_account = TruckAccount.find(params[:id])
  end

  def update
    @truck_account = TruckAccount.find(params[:id])
    if @truck_account.update(truck_account_params)
      flash[:success] = "Account updated successfully"
      redirect_to truck_account_trucks_path(@truck_account)
    else
      flash[:danger] = @truck_account.errors.full_messages.to_sentence
      render :edit
    end
  end

  private
    def truck_account_params
      params.require(:truck_account).permit(:first_name, :last_name, :email, :company, :password, :password_confirmation)
    end

end