Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/auth/:provider/callback' => 'sessions#omniauth'
  root 'sessions#welcome'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'


  resources :users do
    resources :houses, shallow: true ##shallow: true routing to avoid deep nesting
  end

  resources :houses do
    resources :house_rooms
  end

end
