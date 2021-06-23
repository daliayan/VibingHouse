Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'sessions#welcome'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy'

  resources :users do
    resources :houses, shallow: true #only: [:new, :create, :index] #shallow: true routing to avoid deep nesting
  end
  post '/users/:id/houses/new', to: 'houses#create'

  resources :rooms do
    resources :comments
  end
  resources :comments

end
