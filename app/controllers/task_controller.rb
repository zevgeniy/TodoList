class TaskController < ApplicationController
  def create
  	@task = Task.new(params[:tasks])
  	@task.list_id = current_list.id
  	@task.state = false
  	@task.priority = 2
  	respond_to do |format|
      if @task.save
        format.html { redirect_to root_path }
      else
        format.html { redirect_to root_path }
      end
  	end	
  end

  def delete
  	t = Task.find_by_id(params[:id])
    if !t.nil?
   	 t.destroy
    end
    redirect_to root_path
  end

  def update
  	t = Task.find_by_id(params[:id])
  	if !t.nil?
  		t.update_attributes(params[:task])
  		redirect_to root_path
  	end
  end
  
  def completed
  	t = Task.find_by_id(params[:id])  	
  	if !t.nil?
  		t.state = !t.state
  		t.update_attributes(params[:task])  		
  		redirect_to root_path
  	end
  end
  
  def findUser
  	if params[:tasks]
  		@users = User.where("login = \'#{params[:tasks][:name]}\' or email = \'#{params[:tasks][:name]}\'")
  	else
  		@users = User.all
  	end  	
  end
  
  def addUser
  	u = User.find_by_id(params[:finded])
  	if u
  		Task.find_by_id(params[:id]) << u
  	end
  	redirect_to find_user_path
  end
  
end
