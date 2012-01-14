class MainController < ApplicationController
  def index
  	session[:current_user_id] = 1
  	current_user = User.first  
  end

end
