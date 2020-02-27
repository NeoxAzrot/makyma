Rails.application.routes.draw do
  match '/users', to: 'users#index', via: 'get'

  resources :alternatives
  resources :products
  devise_for :users
  resources :categories

  root to: "categories#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end