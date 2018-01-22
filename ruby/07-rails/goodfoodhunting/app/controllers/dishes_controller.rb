class DishesController < ApplicationController
	def new
	end

	def create
		dish = Dish.new
		dish.name = params[:name]
		dish.image_url = params[:image_url]
		dish.save
		redirect_to '/dishes'
	end

	def show
		@dish = Dish.find(params[:id])
	end

	def index
		@dish_list = Dish.all
	end

	def update
		dish = Dish.find(params[:id])
		dish.name = params[:name]
		dish.image_url = params[:image_url]
		dish.save
		redirect_to '/dishes'
	end

	def edit
		@dish = Dish.find(params[:id])
	end

end
