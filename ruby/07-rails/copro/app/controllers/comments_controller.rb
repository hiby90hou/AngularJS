class CommentsController < ApplicationController
	def create

		unless session[:user_id]
			redirect_to '/login' 
			return
		end
		comment = Comment.new
		comment.title = params[:title]
		comment.body = params[:body]
		comment.user_id = params[:user_id]
		comment.project_id = params[:project_id]

		# raise "this is a stop point"

		if comment.save
			redirect_to "/projects/#{params[:project_id]}"
		else
			# render :new
			# redirect_to '/projects/#{params[:project_id]}'
			render :error_page
		end
	end
end
