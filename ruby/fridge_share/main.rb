require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index
end

get '/user/new' do
	erb :signup
end



