Rails.application.routes.draw do
  resources :items
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :movies
  resources :users
  root :to => redirect('/users')
  # root 'movies#index'
  # root :to => redirect('/movies')
  # get '/movies', to: 'movies#index', as: 'director'
  # Defines the root path route ("/")
  # root "articles#index"
end
