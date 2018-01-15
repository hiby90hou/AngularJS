require 'sinatra'
require_relative 'db_config'
require 'sinatra/reloader'
require_relative 'models/dish'
require_relative 'models/comment'

## settings for activerecord


get '/' do
	@dishes = Dishes.all
  erb :index
end

get '/dishes/new' do
	erb :new
end

get	'/dishes/:id' do
	@dish = Dishes.find(params[:id])
	@comments = Comment.where(dish_id: @dish.id)
	erb :show
end

post '/dishes' do
	dish = Dishes.new
	dish.name = params[:name]
	dish.image_url = params[:image_url]
	dish.save

	redirect '/'
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



