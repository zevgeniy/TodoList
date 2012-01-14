module ApplicationHelper

def sign_in(user)
	session[:current_user_id] = user.id
	@current_user = user
end

def current_user=(user)
	@current_user = user
end

def current_user
	@current_user ||= session[:current_user_id] && User.find_by_id(session[:current_user_id])
end

def signed_in?
	!@current_user.nil?
end

end
