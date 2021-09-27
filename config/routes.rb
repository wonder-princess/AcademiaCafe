Rails.application.routes.draw do
  # root to: 'toppages#index'
  root to: 'communities#index'
  get 'userpolicy', to: 'toppages#userpolicy'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  
  resources :users
  resources :communities
  resources :myprofiles
end