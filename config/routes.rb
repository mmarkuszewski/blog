Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'

  resources :posts, except: :index
  resources :comments, only: [:create, :edit, :update, :destroy]

end
