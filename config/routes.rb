Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/items/user', to: 'items#get_items_by_user', as: 'user_items'
  get '/items/category/:category', to: 'items#search_by_category', as: 'search_category'
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
  get "/user", to: "sessions#show", as: "profile"
  get "/user/edit", to: "users#edit", as: "edit_profile"
  get '/items/:id/category', to: 'items#search_by_category', as: 'search_category'
  
  
  
  # Defines the root path route ("/")
  # root "articles#index"
  root :to => redirect('/items')
end
