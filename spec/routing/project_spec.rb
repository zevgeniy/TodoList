require 'spec_helper'

describe 'routing to posts' do   
  
  it 'routes / to projects#my' do
    { :get => "/" }.should route_to(
      :controller => "projects",
      :action => "my"
    )
  end
  
  it 'routes /projects/foreign to projects#foreign' do
    { :get => "/projects/foreign" }.should route_to(
      :controller => "projects",
      :action => "foreign"
    )
  end
  
  it 'routes /projects/:id/share to projects#share for project id' do
    { :get => "/projects/1/share" }.should route_to(
      :controller => "projects",
      :action => "share",
      :id => "1"
    )
  end
  
  it 'routes post /projects/:id/share/:finded to projects#addUser for project id and user id' do
    { :post => "/projects/1/share/3" }.should route_to(
      :controller => "projects",
      :action => "addUser",
      :id => "1",
      :finded => "3"
    )
  end
  
  it 'routes delete /projects/:id/share/:finded to projects#delUser for project id and user id' do
    { :post => "/projects/1/share/3", :method => "delete" }.should route_to(
      :controller => "projects",
      :action => "addUser",
      :id => "1",
      :finded => "3"
    )
  end
  
end 
