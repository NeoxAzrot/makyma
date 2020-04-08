Rails.application.routes.draw do
  resources :subcategories
  match '/users', to: 'users#index', via: 'get'

  resources :alternatives
  resources :products
  devise_for :users
  resources :categories

  root to: "categories#index"

  get 'user/:id' => 'users#show'

  get "/pages/:page" => "pages#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end