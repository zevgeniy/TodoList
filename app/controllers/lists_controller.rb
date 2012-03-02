class ListsController < ApplicationController
  def create
	@list = List.new(params[:lists])
  	@list.project_id = current_project.id
  	respond_to do |format|
      if @list.save
        session[:current_list_id] = @list.id
        format.html { redirect_to :back }
      else
        format.html { redirect_to :back }
      end
  	end	
  end

  def destroy
	l = List.find_by_id(params[:id])
    if !l.nil?
   	 l.destroy
    end
    redirect_to :back
  end

  def update
  l = List.find_by_id(params[:id])
  	if !l.nil?
  		l.update_attributes(params[:list])
  		redirect_to :back
  	end
  end

  def show
   	session[:current_list_id] = params[:id]
  	redirect_to :back
  end
end
