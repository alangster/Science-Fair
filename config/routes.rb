Rails.application.routes.draw do

 resources :posters do
   resources :comments, only: [:create]
 end
 resources :users, except: [:destroy]

end
