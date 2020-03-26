Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :drying_processes
  resources :countries
  resources :varieties
  resources :parents, only: [:new, :create, :destroy]
  resources :productive_countries, only: [:new, :create, :destroy]
  resources :country_process_links, only: [:new, :create, :destroy]
  resources :harvest_periods, only: [:new, :create, :destroy]

  # resources :productive_country, only: [:new, :create]
  # resources :country_process_links, only: [:new, :create]
  # resources :harvest_periods, only: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
