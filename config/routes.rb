Rails.application.routes.draw do
  root 'posts#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/register', to: 'users#new'
  resource :users, only: [:create]
  # resource :sessions, only: [:create]

end
