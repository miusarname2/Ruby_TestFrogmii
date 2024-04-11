Rails.application.routes.draw do
  resources :comments
  resources :earthquakes
  resources :latitudes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "main#index"
   get '/earthquakes/filtered', to: 'earthquakes#filtered'

end
