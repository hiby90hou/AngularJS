class UsersController < ApplicationController
	def new
	end

	def create
		#check email
		user = User.new
		user.name = params[:name]
		user.email = params[:email]
		user.password = params[:password]
		if user.save
			session[:user_id] = user.id #just a hash
			redirect_to '/'
		else
			redirect_to '/login'
		end
	end
end
