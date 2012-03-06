module SessionHelper
	def sign_in(user)
		session[:current_user_id] = user.id
		@current_user = user
	end

	def sign_out
		session[:current_user_id] = nil
		session[:current_project_id] = nil
		session[:current_list_id] = nil
		session[:current_tasks_state] = nil
		@current_project = nil
		@current_list = nil
		@current_user = nil
	end

	def current_user
		@current_user ||= session[:current_user_id] && User.find_by_id(session[:current_user_id])
	end
	
	def current_tab
	  session[:current_tab]
	end

	def signed_in?
		!current_user.nil?
	end


	private
	def current_user=(user)
		@current_user = user
	end

end
