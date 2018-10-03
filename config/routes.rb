Rails.application.routes.draw do
  
  root 'welcome#home'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  resources :users, only: [:index, :new, :show, :create]
  get '/users/:id/collection', to: 'users#collection', as: 'user_collection'

end
