Rails.application.routes.draw do
  devise_for :users
  root 'listings#index'
  get 'admin', to: 'admins#index'
  get 'listings/admin', to: 'listings#admin_index'
  resources :listings
  resources :profiles
  resources :chats, except: [:new, :update]
  patch 'chats/:id', to: 'chats#update'
  put 'chats/:id', to: 'chats#reject_offer'
  post 'chats/new/:id', to: 'chats#new', as: 'new_chat'
  resources :purchases, except: [:show, :edit, :update, :destroy]
  get 'purhcases/myorders', to: 'purchases#show'
  post 'chats/:id', to: 'chats#new_message'
end
