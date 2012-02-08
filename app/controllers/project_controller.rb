class ProjectController < ApplicationController
  def create  
  	@project = Project.new(params[:projects])
  	@project.user_id = current_user.id	
  	respond_to do |format|
      if @project.save && current_user.projects << @project && current_user.shares.last.update_attributes(:author=>true)
        session[:current_project_id] = @project.id
      	session[:current_list_id] = nil
      	current_list = nil
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
   redirect_to :back
  end

  def update
  	p = Project.find_by_id(params[:id])
  	if !p.nil?
  		p.update_attributes(params[:project])
  		redirect_to :back
  	end
  	
  end
  
  def open
  	session[:current_project_id] = params[:id]
  	session[:current_list_id] = nil
  	current_list = nil
  	redirect_to :back
  end

  def share_project
	if params[:tasks]
  		@users = User.where("login = \'#{params[:tasks][:name]}\' or email = \'#{params[:tasks][:name]}\'")
  	else
  		@users = User.all
  	end 
  	@shared =  Project.find_by_id(params[:id])
	@path = share_project_path
  end

  def addUser
  	u = User.find_by_id(params[:finded])
  	if u
  		p = Project.find_by_id(params[:id])
  		p.users << u
  		p.shares.where("user_id = ?",u.id).first.update_attributes(:author=>false)
  		ShareMailer.shareProject(u,p,current_user).deliver
  	end
  	redirect_to share_project_path
  end
  
  def delUser
     	u = User.find_by_id(params[:finded])
	p = Project.find_by_id(params[:id])
  	if u && u != p.author
  		p.users.destroy u
  	end

  	redirect_to share_project_path
  end

end
