Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :items
  resources :users
  resources :new
  resources :wishlists
  
  get '/wishlists/:id/add', to: 'wishlists#create', as: 'add_wishlists'
  delete '/wishlists/:id/delete', to: 'wishlists#destroy', as: 'delete_wish'
  
  get '/register', to: 'users#index', as: 'register'
  post 'sessions/create'
  get '/login', to: 'sessions#new', as: 'login_path'
  post '/login', to: 'sessions#create'
  get "/logout" => "users#logout", :as => "logout"
  get "/users/:id", to: "users#show", as: "profile"
  get "/users/edit", to: "users#edit", as: "edit_profile"
  get '/items/:id/category', to: 'items#search_by_category', as: 'search_category'
  # Defines the root path route ("/")
  # root "articles#index"
  root :to => redirect('/items')
end
