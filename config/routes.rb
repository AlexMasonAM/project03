Rails.application.routes.draw do

  resources :truck_accounts do
    resources :trucks, only: [:create, :update, :destroy]
  end

  resources :trucks, only: [:index, :show]

end
