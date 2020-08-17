Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :posts do
    resources :comments,only: [:create,:destroy]
    resources :likes, only: [:create, :destroy]
  end
  resources :users
  root 'posts#index'
end
