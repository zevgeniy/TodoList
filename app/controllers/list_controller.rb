class ListController < ApplicationController
  def create
	@list = List.new(params[:lists])
  	@list.project_id = current_project.id
  	respond_to do |format|
      if @list.save
        format.html { redirect_to root_path }
      else
        format.html { redirect_to root_path }
      end
  	end	
  end

  def delete
	l = List.find_by_id(params[:id])
    if !l.nil?
   	 l.destroy
    end
    redirect_to root_path
  end

  def update
  l = List.find_by_id(params[:id])
  	if !l.nil?
  		l.update_attributes(params[:list])
  		redirect_to root_path
  	end
  end

  def open
   	session[:current_list_id] = params[:id]
  	redirect_to root_path
  end
end
