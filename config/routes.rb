Rails.application.routes.draw do

  root "application#index"

  namespace :api do
    resources :favorites, :markers, :trucks, :users, except: [:new, :edit]

    resources :truck_accounts, except: [:new, :edit] do
      resources :trucks, except: [:new, :edit]
    end
  end



end
