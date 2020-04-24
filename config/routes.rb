Rails.application.routes.draw do
  get 'posts/index'

  root 'home#top'
  get '/about', to: 'home#about'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :posts, only: [:index,:new,:create,:destroy]
end
