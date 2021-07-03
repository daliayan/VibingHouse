Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get '/auth/:google_oauth2/callback' => 'sessions#omniauth'
  root 'sessions#welcome'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'


  get '/houses/most_expensive' => 'houses#most_expensive'
  
  resources :users do
    resources :houses, shallow: true
  end

  resources :houses do
    resources :house_rooms, only: [:new, :create, :index, :show]
  end

end
