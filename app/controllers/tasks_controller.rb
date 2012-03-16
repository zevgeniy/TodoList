class TasksController < ApplicationController
  before_filter :authenticate_user!
  
  def create
  	@task = Task.new(params[:task])
  	@task.list_id = params[:list_id]
  	
  	respond_to do |format|
  	  if @task.save
  	    format.html { redirect_to :back}
  	    format.json { render json: @task, status: :created}    
  	  else
  	    format.html { redirect_to :back}
  	    format.json { render json: @task.errors, status: :unprocessable_entity }   
  	  end
  	end
        
  end

  def destroy
  	t = Task.find_by_id(params[:id])
    t.destroy
    
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :ok }
    end
  end

  def update
  	t = Task.find_by_id(params[:id])
  	
  	respond_to do |format|
      if t.update_attributes(params[:task])
        format.html { redirect_to :back}
        format.json { head :no_content }
      else
        format.html { redirect_to :back}
        format.json { render json: t.errors, status: :unprocessable_entity }
      end
    end 
  end
  
  def check
  	t = Task.find_by_id(params[:id])  	
  	t.state = !t.state
  	
  	respond_to do |format|
      if t.update_attributes(params[:task])
        format.html { redirect_to :back}
        format.json { head :no_content }
      else
        format.html { redirect_to :back}
        format.json { render json: t.errors, status: :unprocessable_entity }
      end
    end 
  end
  
  def share
  	if params[:tasks]
  		@users = User.where("email = ? and email <> ?",params[:tasks][:email], current_user.email)
  	end 
  	@shared =  Task.find_by_id(params[:id])
	  @path = share_project_list_task_path(params[:project_id],params[:list_id],params[:id])
	  
	  respond_to do |format|
	    format.html { render 'main/_share'}
	    format.json { render json:@users }
	  end 
	  
  end
  
  def addUser
  	u = User.find_by_id(params[:finded])
  	if u
  	  t = Task.find_by_id(params[:id])
  		t.users << u
  		#ShareMailer.shareTask(u,t,current_user).deliver
  	end
  	
  	respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
  
  def delUser
  	u = User.find_by_id(params[:finded])
  	
		Task.find_by_id(params[:id]).users.destroy(u) if u
  	
  	respond_to do |format|
  	  format.html { redirect_to :back }
      format.json { head :no_content }
  	end
  end
  
  def delete_completed
    tasks = Task.where(:list_id => List.select(:id).where(:id => params[:list_id]), :state => true)
    tasks.destroy_all
    
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :ok}
    end
    
  end
  
  def completed
    @tasks = Task.where(:list_id => List.select(:id).where(:project_id => Project.select(:id).where(:user_id => current_user.id))).where(:state => true).order(:priority)
    @tasks = @tasks + current_user.tasks.where(:state=>true)
    @tabs_state = {:completed => true}
    @completed = true
    
    respond_to do |format|
      format.html { render "_all_tasks" }
      format.json { render json:@tasks}
    end
    
  end
  
  def incompleted
    @tasks = Task.where(:list_id => List.select(:id).where(:project_id => Project.select(:id).where(:user_id => current_user.id))).where(:state => false).order(:priority)
    @tasks = @tasks + current_user.tasks.where(:state=>false)
    @tabs_state = {:incompleted => true}
    @completed = false
    
    respond_to do |format|
      format.html { render "_all_tasks" }
      format.json { render json:@tasks }
    end
  end
end
