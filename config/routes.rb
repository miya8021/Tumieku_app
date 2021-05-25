Rails.application.routes.draw do
  resources :users, only: [:show]
  resources :artices
  devise_for :user
  root 'homes#index'
end