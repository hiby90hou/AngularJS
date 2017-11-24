Rails.application.routes.draw do
  
  resources :posts
	# 一般路由
  # get 'posts/:id', :to => 'posts#show' 

    # 命名路由
    # get 'posts/:id', :to => 'posts#show', :as => 'show_post'

  resources :users

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  # resources :posts, :except => :show

  # 命名路由

  #  resources :posts do
  #   get 'resent', :on => :collection
  # end

  # 集合路由 成員路由

  # resources :posts do
  #   collection do
  #     get 'resent'
  #   end
  #   member do
  #     get 'resent'
  #   end
  # end


  # get 'posts/index'

  # get 'posts/show'

  # get 'posts/create'

  # get 'posts/new'

  # resources :posts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
end
