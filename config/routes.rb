Rails.application.routes.draw do

  resources :alternatives
  resources :products
  devise_for :users
  resources :categories

  root to: "categories#index"

  #users roots
  #get 'user/:id' => 'users#show'
  #match '/users', to: 'users#index', via: 'get'
  
  get "/pages/:page" => "pages#show"
  match '/about', to: 'pages#about', via: 'get'
  match '/cgu', to: 'pages#cgu', via: 'get'
  match '/contact', to: 'pages#contact', via: 'get'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end