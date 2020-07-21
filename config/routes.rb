Rails.application.routes.draw do
  devise_for :users
  resources :posts,only: [:index, :show, :new, :create]
  resources :users
  root 'posts#index'
end
