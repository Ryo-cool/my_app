Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments,only: [:create,:destroy]
  end
  resources :users
  root 'posts#index'
end
