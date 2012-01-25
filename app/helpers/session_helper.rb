module SessionHelper
	def sign_in(user)
		session[:current_user_id] = user.id
		@current_user = user
	end

	def sign_out
		session[:current_user_id] = nil
		session[:current_project_id] = nil
		session[:current_list_id] = nil
		@current_project = nil
		@current_list = nil
		@current_user = nil
	end

	def current_user
		@current_user ||= session[:current_user_id] && User.find_by_id(session[:current_user_id])
	end
	
	def current_project
		@current_project ||= session[:current_project_id] && Project.find_by_id(session[:current_project_id])
	end
	
	def current_list
		@current_list ||= session[:current_list_id] && List.find_by_id(session[:current_list_id])
	end

	def signed_in?
		!current_user.nil?
	end

	private
	def current_user=(user)
		@current_user = user
	end
	
	def current_project=(project)
		@current_project = project
	end	
	
	def current_list=(list)
		@current_list = list
	end
end
