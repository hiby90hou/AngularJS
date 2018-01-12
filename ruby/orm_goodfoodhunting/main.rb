require 'sinatra'
require_relative 'db_config'
require 'sinatra/reloader'
require_relative 'models/dish'

## settings for activerecord


get '/' do
	@dishes = Dishes.all
  erb :index
end





