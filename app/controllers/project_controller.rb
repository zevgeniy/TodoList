class ProjectController < ApplicationController
  def create  
  	@project = Project.new(params[:projects])
  	@project.user_id = current_user.id
  	respond_to do |format|
      if @project.save
        format.html { redirect_to root_path, notice: 'Project was successfully created.' }
      else
        format.html { redirect_to root_path }
      end
  	end	 
  end

  def delete
   p = Project.find_by_id(params[:id])
   if !p.nil?
   	p.destroy
   end
   redirect_to root_path
  end

  def update
  	p = Project.find_by_id(params[:id])
  	if !p.nil?
  		p.update_attributes(params[:project])
  		redirect_to root_path
  	end
  	
  end
  
  def open
  	session[:current_project_id] = params[:id]
  	session[:current_list_id] = nil
  	current_list = nil
  	redirect_to root_path
  end

end
