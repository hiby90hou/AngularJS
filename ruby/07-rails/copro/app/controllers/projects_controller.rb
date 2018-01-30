class ProjectsController < ApplicationController
	def new
	end

	def show
		@project = Project.find_by(id:params[:id])
		@comments = @project.comments
		#@comments = Comment.joins("INNER JOIN users ON users.id = comments.user_id").where("project_id=#{params[:id]}")

	end

	def create
		redirect_to '/login' unless session[:user_id]
		project = Project.new
		project.title = params[:title]
		project.user_id = session[:user_id]
		project.preview = params[:file]

		if project.save
			redirect_to '/'
		else
			render :new
		end
	end
end
