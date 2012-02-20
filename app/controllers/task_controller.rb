class TaskController < ApplicationController
  def create
  	@task = Task.new(params[:tasks])
  	@task.list_id = current_list.id
  	@task.state = false
  	@task.priority = 2
  	respond_to do |format|
      if @task.save
        format.html { redirect_to :back }
      else
        format.html { redirect_to :back }
      end
  	end	
  end

  def delete
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
  
  def completed
  	t = Task.find_by_id(params[:id])  	
  	if !t.nil?
  		t.state = !t.state
  		t.update_attributes(params[:task])  		
  		redirect_to :back
  	end
  end
  
  def share_task
  	if params[:tasks]
  		@users = User.where("login = \'#{params[:tasks][:name]}\' or email = \'#{params[:tasks][:name]}\'")
  	else
  		@users = User.where("id <> ?", current_user.id)
  	end 
  	@shared =  Task.find_by_id(params[:id])
	   @path = share_task_path
	 render 'tasks/share_task'
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
    Task.find_by_sql("SELECT * FROM Tasks Where Tasks.list_id in (SELECT list_id FROM Lists WHERE project_id in (SELECT project_id FROM Projects WHERE user_id = #{current_user.id})) AND State = 't'").each{|n| n.destroy}
    redirect_to :back
  end
  
end
