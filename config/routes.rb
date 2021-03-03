Rails.application.routes.draw do

  resources :suggested_alternatives
  resources :categories
  resources :alternatives, :products
  devise_for :users

  root to: "categories#index"

  #users roots
  #get 'user/:id' => 'users#show'
  #match '/users', to: 'users#index', via: 'get'
  
  get "/pages/:page" => "pages#show"
  get '/search', to: 'search#index', as: 'search'
  match '/about', to: 'pages#about', via: 'get'
  match '/cgu', to: 'pages#cgu', via: 'get'
  match '/contact', to: 'pages#contact', via: 'get'
  match '/suggestion', to: 'pages#suggestion', via: 'get'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end