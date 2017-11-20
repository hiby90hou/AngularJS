Rails.application.routes.draw do
  resources :posts
  # get 'posts/index'

  # get 'posts/show'

  # get 'posts/create'

  # get 'posts/new'

  # resources :posts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
end
