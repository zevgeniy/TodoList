class TaskController < ApplicationController
  def create
  	@task = Task.new(params[:tasks])
  	@task.list_id = current_list.id
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
  		t.update_attributes(params[:list])
  		redirect_to root_path
  	end
  end
end
