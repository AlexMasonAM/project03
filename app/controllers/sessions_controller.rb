class SessionsController < ApplicationController

  def new
    puts session.inspect
    redirect_to root_path if current_user
  end

  def create

    if params['type'] == 'user'
      acct = User.find_by(email: params[:account][:email])
    elsif params['type'] == 'truck'
      acct = TruckAccount.find_by(email: params[:account][:email])
    end

    if acct && acct.authenticate(params[:account][:password])
      if params['type'] == 'user'
        session[:user_id] = acct.id.to_s
        session[:truck_id] = nil
      else
        session[:truck_id] = acct.id.to_s
        session[:user_id] = nil
      end
      redirect_to root_path
    else
      flash.now[:danger] = "Username, password, or account type is incorrect"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    session[:truck_id] = nil
    redirect_to login_path
  end

end