Rails.application.routes.draw do

  root 'welcome#home'

  resources :users, only: [:index, :new, :show, :create]
  get '/users/:id/collection', to: 'users#collection', as: 'user_collection'

end
