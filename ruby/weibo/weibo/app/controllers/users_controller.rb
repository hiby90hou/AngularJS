class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(users_params)
  	if @user.save
  		session[:user_id]=@user.id
  		redirect_to @user
  	else
  		render 'new'
  	end
  end


  def show
  	@user = User.find(params[:id])
  end

  # 健壯參數
  def users_params
  	params.require(:user).permit(:userName, :email, :password, :password_confirmation)
  end
end
