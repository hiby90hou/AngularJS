require 'sinatra'
require 'sinatra/reloader'
require 'weather-api'

get '/' do
	# 'welcome'
	city = params[:city]
	country = params[:country]
	@res = Weather.lookup_by_location('#{city}, #{country}', Weather::Units::CELSIUS)
	# @res = Weather.lookup_by_location('Melbourne, Australia', Weather::Units::CELSIUS)
	# @temperature = res.condition.temp
	# @weather = res.condition.text
	erb(:index)
end