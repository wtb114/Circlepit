Rails.application.routes.draw do

  devise_for :users
  root to: "top#index"
  resources :users
  resources :artists do
    member do
      post "add", to: "favorites#create"
    end
  end
  resources :favorites, only: [:destroy]
  resources :events
  resources :groups, only: [:show, :edit, :update, :destroy]
end