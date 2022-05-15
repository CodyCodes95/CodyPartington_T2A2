Rails.application.routes.draw do
  devise_for :users
  resources :listings
  resources :profiles
  resources :purchases
  root 'listings#index'
  get '/admin', to: 'admin#index', as: 'admin'
end
