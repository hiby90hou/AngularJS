require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

require_relative 'models/dish'

options = {
	adapter: 'postgresql',
	database: 'goodfoodhunting',
	username: 'darkend'
}

ActiveRecord::Base.establish_connection(options)
