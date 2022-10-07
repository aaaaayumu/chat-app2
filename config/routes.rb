Rails.application.routes.draw do
  resources :users, only: [:edit, :update]
  devise_for :users
  root to: "messages#index"
  resources :rooms, only: [:new, :create]
end
