Rails.application.routes.draw do

  devise_for :users
  root to: "top#index"
  resources :artists, only: :show
  resources :users, only: [:show, :edit, :update]
  resources :events, only: :show
  resources :groups, only: :show
end
