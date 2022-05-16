Rails.application.routes.draw do
  devise_for :users
  root 'listings#index'
  get 'admin', to: 'admins#index'
  get 'listings/admin', to: 'listings#admin_index'
  resources :listings
  resources :profiles
  resources :purchases, except: [:show, :edit, :update, :destroy]
  get 'purhcases/myorders', to: 'purchases#show'
end
