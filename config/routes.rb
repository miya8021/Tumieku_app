Rails.application.routes.draw do
  root 'homes#index'
  devise_for :user
  resources :users, only: [:show]
  resources :articles
end