class PagesController < ActionController::Base
	def home
		render :home
	end

	def about
		# render :about # default is :about
	end
end