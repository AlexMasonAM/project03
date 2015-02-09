Rails.application.routes.draw do


  root to: 'home#index'
  
  resources :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".



  # need to change this to our actual main page.  just needed a placeholder root
  root "application#home"


  resources :truck_accounts, except: [:index] do
    resources :trucks, only: [:index, :create, :update, :destroy]
  end

  resources :trucks, only: [:index, :show]

  resources :favorites
  resources :markers

end
