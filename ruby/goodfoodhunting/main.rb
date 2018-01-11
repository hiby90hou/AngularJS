     
require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'pry'

get '/' do
	# @dishes = ['a','b','c']
	conn = PG.connect(dbname: 'goodfoodhunting')
	sql = "SELECT * FROM dishes;"
	@dishes = conn.exec(sql)
	conn.close
	# binding.pry
	# return result[0].to_json
  erb :index
end

get '/dishes/new' do
  erb :new_dishes
end

post '/dishes' do
	conn = PG.connect(dbname: 'goodfoodhunting')
	sql = "INSERT INTO dishes (name,image_url) VALUES ('#{params[:name]}','#{params[:image_url]}')"
	result = conn.exec(sql)
	conn.close

	redirect '/'
	# erb :dishes
end

get '/dishes/:id' do
	# return 'lalala'
	# return params[:id]
	# get a single dish with the id
	# and display it in browser
	conn = PG.connect(dbname: 'goodfoodhunting')
	sql = "SELECT * FROM dishes where id = '#{params[:id]}';"
	@dish = conn.exec(sql)[0]
	conn.close
	# return @result[0].to_json
	erb :show
end

post '/dishes/:id/delete' do
	conn = PG.connect(dbname: 'goodfoodhunting')
	sql = "DELETE FROM dishes where id ='#{params[:id]}';"
	conn.exec(sql)

	conn.close
	# return "delete dish..."
	redirect '/'
end




