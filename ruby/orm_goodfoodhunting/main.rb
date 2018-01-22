require 'sinatra'
require_relative 'db_config'
require 'sinatra/reloader'
require_relative 'models/dish'
require_relative 'models/comment'
require_relative 'models/user'

enable :sessions #sinatra provide this feature

helpers do
	def current_user
		User.find_by(id: session[:user_id])
	end

	def logined_in?
		# if current_user
		# 	return true
		# else
		# 	return false
		# end
		return !!current_user
	end
end

## settings for activerecord


get '/' do
	@dishes = Dishes.all
  erb :index
end

get '/dishes/new' do
	erb :new
end

get	'/dishes/:id' do
	# unless session[:user_id] 
	# 	redirect '/' 
	# end
	redirect '/' unless logined_in? 

	@dish = Dishes.find(params[:id])
	@comments = Comment.where(dish_id: @dish.id)
	erb :show
end

post '/dishes' do
	@dish = Dishes.new
	@dish.name = params[:name]
	@dish.image_url = params[:image_url]
	if @dish.save # return a boolean
		redirect "/dishes/#{params[:dish_id]}"
	else
		erb :new
	end
end

delete '/dishes/:id' do
	dish = Dishes.find(params[:id])
	dish.destroy
	redirect '/'
end

get '/dishes/:id/edit' do
	@id = params[:id]
	@dish = Dishes.find(params[:id])
	erb :edit
end

put '/dishes/:id' do
	dish = Dishes.find(params[:id]) # assign to temporary variable 
	dish.name = params[:name]
	dish.image_url = params[:image_url]
	dish.save
	redirect "/dishes/#{params[:id]}"

end

post '/comments' do
	comment = Comment.new
	comment.body = params[:body]
	comment.dish_id = params[:dish_id]
	if comment.save # return a boolean
		redirect "/dishes/#{params[:dish_id]}"
	else
		erb :new
	end
end

get '/login' do
	erb :login 
end

post '/session' do 
	#check email
	user = User.find_by(email: params[:email])

	#check password
	if user && user.authenticate(params[:password])
		# have a user and authenticate return truthy
		session[:user_id] = user.id #just a hash
		redirect '/'
	else
		erb :login
	end
end

delete '/session' do
	session[:user_id] = nil
	redirect '/'
end
