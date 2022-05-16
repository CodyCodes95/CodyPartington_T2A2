Rails.application.routes.draw do
  devise_for :users
  root 'listings#index'
  get 'admin', to: 'admins#index'
  get 'listings/admin', to: 'listings#admin_index'
  resources :listings
  resources :profiles
  resources :purchases
end
