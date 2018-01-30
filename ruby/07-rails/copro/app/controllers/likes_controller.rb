class LikesController < ApplicationController
	def create
		redirect_to '/login' unless session[:user_id]
		like = Like.new
		like.user_id = session[:user_id]
		like.project_id = params[:project_id]
		# binding.pry
		if like.save
			redirect_to "/projects/#{like.project_id}"
		end
	end
end
