Rails.application.routes.draw do

  root to: "posts#index"

  # Default devise routing
  devise_for :users
  # Custom routes for sign_in/sign_out
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    delete '/logout' => 'devise/sessions#destroy'
  end

  resources :posts

end
