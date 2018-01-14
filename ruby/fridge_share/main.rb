require 'sinatra'
require 'sinatra/reloader'
require 'pg'

get '/' do
  erb :index
end

get '/users/new' do
	@alert = params[:alert_info]
	erb :signup
end

post '/users' do
	if params[:password] == params[:password_confirmation]
		conn = PG.connect(dbname: 'fridge_db')
		sql = "INSERT INTO user_table
						(username, email, password,fridge_quantity)
						VALUES('#{params[:username]}', '#{params[:email]}', '#{params[:password]}','0');"
		result = conn.exec(sql)
		conn.close
		redirect "/users/#{params[:username]}"
	else
		redirect '/users/new?alert_info=Please input same password in password and password confirmation'
	end
end

post '/users/search' do
	redirect "/users/#{params[:username]}"
end

get '/users/:username' do
		conn = PG.connect(dbname: 'fridge_db')
		sql = "SELECT * FROM user_table WHERE username = '#{params[:username]}';"
		result = conn.exec(sql)
		conn.close

		@user_name = result[0]['username']
		@user_id = result[0]['user_id']
		@fridge_quantity = result[0]['fridge_quantity'].to_i

		if @fridge_quantity > 0
			conn = PG.connect(dbname: 'fridge_db')
			sql = "SELECT * FROM fridge_user_relationship WHERE user_id = '#{@user_id}';"
			@fridge_list = conn.exec(sql2)
			conn.close
		end

		# return num = fridge_list[0].to_json

		erb :user_main_page
end

