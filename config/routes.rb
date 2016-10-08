Rails.application.routes.draw do

  devise_for :users
  root to: "top#index"
  resources :artists, only: [:show, :new, :create]
  resources :users, only: [:show, :edit, :update]
  resources :events, only: :show
  resources :groups, only: [:show, :edit, :update]
end