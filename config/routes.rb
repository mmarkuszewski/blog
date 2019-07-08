Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'

  namespace :admin do
    resources :users, only: [:destroy, :index]
    resources :posts, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :posts, only: :show do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
end
