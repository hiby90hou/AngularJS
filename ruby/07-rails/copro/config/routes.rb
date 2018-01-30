Rails.application.routes.draw do
  resources :likes
  resources :comments, only: [:create]
  resources :projects, only: [:new, :create, :show]
  # resources :projects, except: [:new, :create]
	get '/', to: 'pages#home'

	get '/login', to: 'session#new'
	get '/logout', to: 'session#destroy'
	post '/session', to: 'session#create'

	get '/users/new', to: 'users#new'
	post '/users', to: 'users#create'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
