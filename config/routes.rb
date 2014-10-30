Rails.application.routes.draw do

  root "posters#index"

 resources :posters

 resources :comment, only: [:create, :destroy]

 resources :users, except: [:destroy]

 resources :tags, only: [:show]

end
