Rails.application.routes.draw do
  root 'homes#index'
  devise_for :user
  resources :users, only: %i[show]
  resources :articles
  resources :exercises
  resources :articles do
    resource :likes, only: %i[create destroy]
  end
end