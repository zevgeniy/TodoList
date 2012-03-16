require 'spec_helper'

describe 'routing to task' do
  it 'routes projects/:project_id/lists/:list_id/tasks/:id/share to tasks#share for tasks id' do
    { :get => "/projects/1/lists/2/tasks/1/share" }.should route_to(
      :controller => "tasks",
      :action => "share",
      :id => "1",
      :list_id => "2",
      :project_id => "1"
    )
  end
  
  it 'routes post projects/:project_id/lists/:list_id/tasks/:id/share/:finded to tasks#addUser for task id and user id' do
    { :post => "projects/1/lists/2/tasks/1/share/3" }.should route_to(
      :controller => "tasks",
      :action => "addUser",
      :id => "1",
      :finded => "3",
      :project_id => "1",
      :list_id => "2"
    )
  end
  
  it 'routes delete projects/:project_id/lists/:list_id/tasks/:id/share/:finded to tasks#delUser for task id and user id' do
    { :post => "projects/1/lists/2/tasks/1/share/3", :method => "delete" }.should route_to(
      :controller => "tasks",
      :action => "addUser",
      :id => "1",
      :finded => "3",
      :project_id => "1",
      :list_id => "2"
    )
  end
  
  it 'routes projects/:project_id/lists/:list_id/tasks/:id/check to tasks#check for task id' do
    { :get => "projects/1/lists/2/tasks/1/check" }.should route_to(
      :controller => "tasks",
      :action => "check",
      :id => "1",
      :project_id => "1",
      :list_id => "2"
    )
  end
  
  it 'routes delete projects/:project_id/lists/:list_id/tasks/completed to tasks#delete_completed' do
    pending "Unknow error"
    { :post => "projects/1/lists/2/tasks/completed", :method => "delete" }.should route_to(
      :controller => "tasks",
      :action => "delete_completed",
      :project_id => "1",
      :list_id => "2"
    )
  end
  
  it 'routes /incompleted to tasks#incompleted' do
    { :get => "/incompleted" }.should route_to(
      :controller => "tasks",
      :action => "incompleted"
    )
  end
  
  it 'routes /completed to tasks#completed' do
    { :get => "/completed" }.should route_to(
      :controller => "tasks",
      :action => "completed"
    )
  end
  
end
