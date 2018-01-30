class SessionController < ApplicationController
	def new
	end

	def create
		#check email
		user = User.find_by(email: params[:email])

		#check password
		if user && user.authenticate(params[:password])
			# have a user and authenticate return truthy
			session[:user_id] = user.id #just a hash
			redirect_to '/'
		else
			# redirect_to '/login'
			render :new
		end
	end

	def destroy
		session[:user_id] = nil;
		redirect_to '/'
	end
end