Rails.application.routes.draw do

devise_for :users, :controllers => {
  :sessions      => "users/sessions",
  :registrations => "users/registrations",
  :passwords     => "users/passwords",
  :omniauth_callbacks => "users/omniauth_callbacks"
}

  root to: "top#index"
  resources :users do
    member do
      get :following, :followers, :users_tweets, :users_comments
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :artists do
    member do
      post "add", to: "favorites#create"
      get "show_favorites" => "favorites#show_favorites"
    end
  end
  resources :favorites, only: [:destroy, :index]
  resources :events do
    member do
      post "add", to: "clips#create"
      get "show_clips" => "clips#show_clips"
    end
  end
  resources :clips, only: [:destroy, :index]
  resources :groups, only: [:show, :edit, :update, :destroy]
  get "show_tweets" => "tweets#show_tweets"
  get "show_comments" => "tweets#show_comments"
  get "following_tweets" => "tweets#following_tweets"
  resources :tweets do
    resources :comments, only: [:create, :destroy]
  end
end