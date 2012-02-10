class SessionController < ApplicationController
  def new
    @user = User.new
  end

  def create
  	@user = User.authenticate(params[:sessions][:login], params[:sessions][:password])
  	if !@user.nil?
  		sign_in @user	
  		redirect_to root_path 	
  	else
  		render action: "new"
  	end  	
  end

  def destroy
  	sign_out
  	redirect_to root_path
  end

end
