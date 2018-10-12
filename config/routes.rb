Rails.application.routes.draw do

  root 'welcome#home'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/auth/facebook/callback', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  resources :users, only: [:index, :show, :create]
  get '/signup', to:'users#new', as: 'new_user'
  get '/users/:id/recordbox', to: 'users#recordbox', as: 'user_recordbox'
  get '/users/:id/recordbox/rating', to: 'users#recordbox_rating', as: 'user_recordbox_rating'
  get '/users/:id/recordbox/desc', to: 'users#recordbox_desc', as: 'user_recordbox_desc'
  get '/users/:id/recordbox/asc', to: 'users#recordbox_asc', as: 'user_recordbox_asc'
  get '/users/:id/reviewed_records', to: 'users#reviewed_records', as: 'user_reviewed_records'

  resources :records do
    collection do
      get :rating_desc
      get :released_desc
      get :released_asc
    end
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end

end
