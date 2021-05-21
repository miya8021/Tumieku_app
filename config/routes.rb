Rails.application.routes.draw do
  resources :users, only: [:show]
  devise_for :user
  root 'homes#index'
end