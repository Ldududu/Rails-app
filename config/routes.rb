Rails.application.routes.draw do
  root 'home#top'
  get '/about', to: 'home#about'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users
end
