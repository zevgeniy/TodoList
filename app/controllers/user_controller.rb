class UserController < ApplicationController
  def show
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		redirect_to root_path
  	else
  		redirect_to signup_path	
  	end	
  	
  end

  def edit
  end

  def update
  end

end
