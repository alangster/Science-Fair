Rails.application.routes.draw do

 resources :posters

 resources :comment, only: [:create]

 resources :users, except: [:destroy]

 # get "/login", :sessions, "sessions#new"

end
