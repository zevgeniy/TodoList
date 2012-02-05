class SessionController < ApplicationController
  def signin

  end

  def new
  	user = User.authenticate(params[:sessions][:login], params[:sessions][:password])
  	if !user.nil?
  		sign_in user		
  	else
  		flash[:error] = 'Error!'
  	end
  	redirect_to root_path 
  end

  def signout
  	sign_out
  	redirect_to root_path
  end

end
