Rails.application.routes.draw do

  resources :categories, :alternatives, :products
  resources :suggested_alternatives do 
    member do
      patch:add_to_alternatives 
      put:add_to_alternatives 
    end
  end
  devise_for :users, controllers: {sessions: 'sessions'}

  root to: "categories#index"

  #users roots
  #get 'user/:id' => 'users#show'
  #match '/users', to: 'users#index', via: 'get'
  
  get '/contact', to: 'contacts#new'
  post '/contact', to: 'contacts#create'
  #get "/pages/:page" => "pages#show"
  get '/search', to: 'search#index', as: 'search'
  get '/suggestion', to: 'suggested_alternatives#new'
  post '/suggestion', to: 'suggested_alternatives#create'

  match '/about', to: 'pages#about', via: 'get'
  match '/cgu', to: 'pages#cgu', via: 'get'
  match '/presse', to: 'pages#presse', via: 'get'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end