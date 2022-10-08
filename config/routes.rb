Rails.application.routes.draw do
  resources :users, only: [:edit, :update]
  devise_for :users
  root to: "rooms#index"
  resources :rooms, only: [:new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end
end
