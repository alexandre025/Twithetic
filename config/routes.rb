Rails.application.routes.draw do

  root to: 'posts#index'

  # Default devise routing
  devise_for :users
  # Custom routes for sign_in/sign_out
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end

  resources :posts do
    post 'like' => 'posts#like'
    post 'retweet' => 'posts#retweet'

    resources :comments, only: [:create,:destroy]
  end

  post 'search' => 'search#search_results'
  get 'hashtag/:hashtag' => 'search#hashtag'

  resources :users, only: [:show] do
    post 'follow' => 'users#follow'
  end

  # Routes for errors_controller
  get '/404', :to => 'errors#not_found'
  get '/422', :to => 'errors#unacceptable'
  get '/500', :to => 'errors#internal_error'


end
