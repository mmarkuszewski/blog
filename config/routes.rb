Rails.application.routes.draw do
  root 'posts#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/register', to: 'users#new'
  resources :users, only: [:create, :edit, :update]
  resources :posts, only: [:new, :create, :edit, :update, :destroy, :show]
  resources :comments, only: [:create, :edit, :update, :destroy]

end
