Rails.application.routes.draw do

  root 'welcome#home'

  get '/signup', to:'users#new', as: 'new_user'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  resources :users, only: [:index, :show, :create]
  get '/signup', to:'users#new', as: 'new_user'
  get '/users/:id/recordbox', to: 'users#recordbox', as: 'user_recordbox'

end
