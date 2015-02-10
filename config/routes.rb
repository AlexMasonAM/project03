Rails.application.routes.draw do

  root "application#index"

  namespace :api do
    resources :favorites, :markers, :trucks, :users, except: [:new, :edit]

    resources :truck_accounts, except: [:new, :edit] do
      resources :trucks, except: [:new, :edit]
    end
  end


  # these might no longer be needed
  # resources :truck_accounts, except: [:index] do
  #   resources :trucks, only: [:index, :create, :update, :destroy]
  # end
  # resources :trucks, only: [:index, :show]
  # resources :users
  # resources :favorites
  # resources :markers

end
