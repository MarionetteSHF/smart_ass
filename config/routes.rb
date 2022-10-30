Rails.application.routes.draw do
  resources :items
  get '/items/:id/category', to: 'items#search_by_category', as: 'search_category'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :movies
  resources :users
  root :to => redirect('/register')
  # root 'movies#index'
  # root :to => redirect('/movies')
  get '/register', to: 'users#index', as: 'users_path'
  post 'sessions/create'
  get '/login', to: 'sessions#new', as: 'login_path'
  post '/login', to: 'sessions#create'
  # Defines the root path route ("/")
  # root "articles#index"
end
