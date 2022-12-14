Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/items/user', to: 'items#get_items_by_user', as: 'user_items'
  post "/items/:id/comment", to: "comments#create", as: 'create_comment'
  get '/items/category/:category', to: 'items#search_by_category', as: 'search_category'
  get '/users/items', to: 'items#get_items_by_user', as: 'search_user_items'
  get '/search', to: 'items#search', as: 'search'
  resources :items
  resources :users
  resources :new
  resources :wishlists

  get '/wishlists/:id/add', to: 'wishlists#create', as: 'add_wishlists'
  delete '/wishlists/:id/delete', to: 'wishlists#destroy', as: 'delete_wish'

  get '/myitems', to: 'wishlists#myitems', as: 'myitems'
  

  get '/register', to: 'users#index', as: 'register'
  post 'sessions/create'
  get '/login', to: 'sessions#new', as: 'login_path'
  post '/login', to: 'sessions#create'
  get "/logout" => "users#logout", :as => "logout"
  get "/users/:id", to: "users#show", as: "profile"
  get "/users/:id/reset", to: "users#reset", as: "reset_password"
  get '/auth/:provider/callback' => 'sessions#omniauth'

  
  root :to => redirect('/items')
end
