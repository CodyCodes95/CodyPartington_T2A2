Rails.application.routes.draw do
  devise_for :users
  resources :listings
  resources :profiles, except: [:destroy]
  root 'listings#index'
end
