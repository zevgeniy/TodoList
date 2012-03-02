class TasksController < ApplicationController
  def create
  	@task = Task.new(params[:tasks])
  	@task.list_id = current_list.id
  	@task.state = false
  	@task.priority = 2
    @task.save    
    redirect_to :back    
  end

  def destroy
  	t = Task.find_by_id(params[:id])
    if !t.nil?
   	 t.destroy
    end
    redirect_to :back
  end

  def update
  	t = Task.find_by_id(params[:id])
  	if !t.nil?
  		t.update_attributes(params[:task])
  		redirect_to :back
  	end
  end
  
  def check
  	t = Task.find_by_id(params[:id])  	
  	if !t.nil?
  		t.state = !t.state
  		t.update_attributes(params[:task])  		
  		redirect_to :back
  	end
  end
  
  def share
  	if params[:tasks]
  		@users = User.where("login = \'#{params[:tasks][:name]}\' or email = \'#{params[:tasks][:name]}\'")
  	else
  		@users = User.where("id <> ?", current_user.id)
  	end 
  	@shared =  Task.find_by_id(params[:id])
	   @path = share_task_path
	 render 'main/_share'
  end
  
  def addUser
  	u = User.find_by_id(params[:finded])
  	if u
  	  t = Task.find_by_id(params[:id])
  		t.users << u
  		#ShareMailer.shareTask(u,t,current_user).deliver
  	end
  	redirect_to share_task_path
  end
  
  def delUser
  	u = User.find_by_id(params[:finded])
  	if u
  		Task.find_by_id(params[:id]).users.destroy u
  	end
  	redirect_to share_task_path
  end
  
  def delete_completed
    Task.where(:list_id => List.select(:id).where(:project_id => Project.select(:id).where(:user_id => current_user.id),:id => current_list.id), :state => true).destroy_all
    redirect_to :back
  end
  
end
