require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'

get '/' do
  erb :index
end

get '/movie_input' do
	@result = HTTParty.get('http://www.omdbapi.com/?apikey=2f6435d9&t='+ params[:movie_name])
	file = File.open('suckers.txt','a') #append mode
	file.puts(@result)
	file.close
	erb :movie
	# return @result['Poster'].inspect
end

get '/about' do
	erb :about
end



