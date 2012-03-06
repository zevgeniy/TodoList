class ListsController < ApplicationController
  def create
	  @list = List.new(params[:lists])
  	@list.project_id = params[:project_id]
  	@project = Project.find_by_id(params[:project_id])
  	
  	respond_to do |format|
      if @list.save
        format.html { redirect_to @project, notice: 'List was successfully created.'}
        format.json { render json: @list, status: :created, location: @list }
      else
        format.html {redirect_to @project}
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end 
  end

  def destroy
	  l = List.find_by_id(params[:id])
   	l.destroy
   	
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :ok }
    end    
  end

  def update
    l = List.find_by_id(params[:id])

  	respond_to do |format|
      if l.update_attributes(params[:list])
        format.html { redirect_to :back}
        format.json { head :no_content }
      else
        format.html { redirect_to :back}
        format.json { render json: l.errors, status: :unprocessable_entity }
      end
    end 
  end

  def show
    @project = Project.find_by_id(params[:project_id])
    @projects = session[:current_tab] == 1 ? current_user.my_projects : current_user.shared_projects
   	@list = List.find_by_id(params[:id])
   	@lists = @project.lists
   	@tasks = @list.tasks
  	
  	respond_to do |format|
  	  format.html {render "main/_page"}
  	  format.json {render json:@tasks}
  	end
  end
end
