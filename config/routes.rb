Rails.application.routes.draw do

  resources :truck_accounts, except: [:index] do
    resources :trucks, only: [:create, :update, :destroy]
  end

  resources :trucks, only: [:index, :show]

end
