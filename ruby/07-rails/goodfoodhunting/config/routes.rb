Rails.application.routes.draw do
  resources :dishes # this line make a new route
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  							# controller file & method

  # get '/dishes/new', to: 'dishes#new'
  # get '/dishes/:id', to: 'dishes#show'
  # get '/dishes', to: 'dishes#index'
  # post '/dishes', to: 'dishes#create'

  get '/', to: 'pages#home'

  get '/about', to: 'pages#about'

end
