Rails.application.routes.draw do

  # ng-app
  root "application#index"

  # api routes
  namespace :api do
    resources :favorites, :markers, :trucks, :users, except: [:new, :edit]

    resources :truck_accounts, except: [:new, :edit] do
      resources :trucks, except: [:new, :edit] do
        resources :markers, only: [:create]
      end
    end
  end

  # signup / login routes
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/truck-signup' => 'truck_accounts#new'
  post '/truck-signup' => 'truck_accounts#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
