Rails.application.routes.draw do
  
  # root "application#home"
  # resources :users

  # resources :truck_accounts, except: [:index] do
  #   resources :trucks, only: [:index, :create, :update, :destroy]
  # end

  # resources :trucks, only: [:index, :show]

  # resources :favorites
  resources :markers

  root "application#index"
  # get '*path' => 'application#index'
  namespace :api do
    resources :trucks
  end
end
