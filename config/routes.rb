Rails.application.routes.draw do


  # need to change this to our actual main page.  just needed a placeholder root
  root "application#home"


  resources :truck_accounts, except: [:index] do
    resources :trucks, only: [:index, :create, :update, :destroy]
  end

  resources :trucks, only: [:index, :show]

  resources :favorites
  resources :markers

end
