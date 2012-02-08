class MainController < ApplicationController
def index
	if !signed_in?
		redirect_to signin_path;
	else
	  @projects = current_user.my_projects
	  if !@projects.include? current_project    
      session[:current_project_id] = nil
      session[:current_list_id] = nil
      @current_project = nil
      @current_list = nil
    end 
	  @tasks = current_list.tasks if current_list
  end
end

def foreign
  @projects = current_user.shared_projects
  if !@projects.include? current_project    
    session[:current_project_id] = nil
    session[:current_list_id] = nil
    @current_project = nil
    @current_list = nil
  end  
	@tasks = current_list.tasks if current_list
	@foreign = true
end

def completed
  @tasks = Task.find_by_sql("SELECT * FROM Tasks Where Tasks.list_id in (SELECT list_id FROM Lists WHERE project_id in (SELECT project_id FROM Projects WHERE user_id = #{current_user.id})) AND State = 't' ORDER BY priority")
  @tasks = @tasks + current_user.tasks.where("state = ?",true)
  @complated = true
end

def not_completed
  @tasks = Task.find_by_sql("SELECT * FROM Tasks Where Tasks.list_id in (SELECT list_id FROM Lists WHERE project_id in (SELECT project_id FROM Projects WHERE user_id = #{current_user.id})) AND State <> 't' ORDER BY priority")
  @tasks = @tasks + current_user.tasks.where("state = ?",false);
  @complated = false
end

end
