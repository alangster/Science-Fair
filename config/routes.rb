Rails.application.routes.draw do

  root "posters#index"

  resources :posters

	resources :comments, only: [:create]

  resources :users, except: [:destroy]

  resources :tags, only: [:show]

  post 'log_in', to: 'sessions#create', as: :login
  get 'log_out', to: 'sessions#destroy', as: :logout

  get 'filter_sort', to: 'posters#filter_sort', as: :filter_sort

  post 'comment/:comment_id/point', to: 'comments#add_point', as: :add_point_comment
  post 'user/:user_id/point', to: 'users#add_point', as: :add_point_user
  post 'poster/:poster_id/point', to: 'posters#add_point', as: :add_point_poster

  get 'poster/:id/download', to: 'posters#download', as: :poster_download
end
