Rails.application.routes.draw do

  # Default devise routing
  devise_for :users
  # Custom routes for sign_in/sign_out
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    delete '/logout' => 'devise/sessions#destroy'
  end

end
