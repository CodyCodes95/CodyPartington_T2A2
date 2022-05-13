Rails.application.routes.draw do
  devise_for :users
  resources :listings
  resources :profiles
  root 'listings#index'
end
