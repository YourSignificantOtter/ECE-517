Rails.application.routes.draw do
  resources :jobs
  resources :applications
  resources :companies
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'home', to: 'sessions#home', as: 'home'
  post 'set_current_role', to: 'sessions#set_current_role', as: 'set_current_role'

  resources :users
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "sessions#new"
end
