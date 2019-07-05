Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'

  namespace :admin do
    resources :users, only: [:destroy, :index]
  end

  resources :posts, except: :index do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
end
