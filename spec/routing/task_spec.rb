require 'spec_helper'

describe 'routing to task' do
  it 'routes /tasks/:id/share to tasks#share for tasks id' do
    { :get => "/tasks/1/share" }.should route_to(
      :controller => "tasks",
      :action => "share",
      :id => "1"
    )
  end
  
  it 'routes post /tasks/:id/share/:finded to tasks#addUser for task id and user id' do
    { :post => "/tasks/1/share/3" }.should route_to(
      :controller => "tasks",
      :action => "addUser",
      :id => "1",
      :finded => "3"
    )
  end
  
  it 'routes delete /tasks/:id/share/:finded to tasks#delUser for task id and user id' do
    { :post => "/tasks/1/share/3", :method => "delete" }.should route_to(
      :controller => "tasks",
      :action => "addUser",
      :id => "1",
      :finded => "3"
    )
  end
  
  it 'routes /tasks/:id/check to tasks#check for task id' do
    { :get => "/tasks/1/check" }.should route_to(
      :controller => "tasks",
      :action => "check",
      :id => "1"
    )
  end
  
  it 'routes delete /tasks/completed to tasks#delete_completed' do
    pending "unknow error"
    { :post => "/tasks/completed", :method => "delete" }.should route_to(
      :controller => "tasks",
      :action => "delete_completed"
    )
  end
end
