Rails.application.routes.draw do
  root 'homes#index'
  devise_for :user
  resources :exercises
  resources :users, only: %i[show] do
    resource :relationships, only: [:create, :destroy]
    # ユーザーidが含まれているURLを使用
    get :follows, on: :member
    get :followers, on: :member
  end
  resources :articles do
    resource :likes, only: %i[create destroy]
    resources :comments, only: %i[create destroy]
  end
end