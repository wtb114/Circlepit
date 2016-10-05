Rails.application.routes.draw do

  root to: "top#index"
  resources :artists, only: :show
  resources :events, only: :show
end
