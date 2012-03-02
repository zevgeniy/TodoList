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
	  @tabs_state = {:index => true}
	  render "main/_page"
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
	
	@tabs_state = {:foreign => true}
	
	render "main/_page"
end

def completed
  @tasks = Task.where(:list_id => List.select(:id).where(:project_id => Project.select(:id).where(:user_id => current_user.id))).where(:state => true).order(:priority)
  @tasks = @tasks + current_user.tasks.where(:state=>true)
  @tabs_state = {:completed => true}
  @completed = true
  render "main/_all_tasks"
end

def incompleted
  @tasks = Task.where(:list_id => List.select(:id).where(:project_id => Project.select(:id).where(:user_id => current_user.id))).where(:state => false).order(:priority)
  @tasks = @tasks + current_user.tasks.where(:state=>false)
  @tabs_state = {:incompleted => true}
  @completed = false
  render "main/_all_tasks"
end

end
