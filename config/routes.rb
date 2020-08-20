Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :posts do
    resources :comments,only: [:create,:destroy]
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :users
  resources :relationships, only: [:create, :destroy]
  root 'posts#index'
end
