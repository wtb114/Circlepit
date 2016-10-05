Rails.application.routes.draw do

  root to: "top#index"
  resources :artists, only: :show
  
end
