Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'sessions#welcome'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/auth/:provider/callback' => 'sessions#omniauth'

  resources :users do
    resources :houses, shallow: true ##shallow: true routing to avoid deep nesting
  end

  resources :houses do
    resources :house_rooms
  end

  # resources :houses do
  #   resources :comments
  # end
  # resources :comments

end
