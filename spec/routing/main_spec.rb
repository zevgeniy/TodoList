require 'spec_helper'

describe 'routing to main' do
  it 'routes / to main#index' do
    { :get => "/" }.should route_to(
      :controller => "main",
      :action => "index"
    )
  end
  
  it 'routes /foreign to main#foreign' do
    { :get => "/foreign" }.should route_to(
      :controller => "main",
      :action => "foreign"
    )
  end
  
  it 'routes /incompleted to main#incompleted' do
    { :get => "/incompleted" }.should route_to(
      :controller => "main",
      :action => "incompleted"
    )
  end
  
  it 'routes /completed to main#completed' do
    { :get => "/completed" }.should route_to(
      :controller => "main",
      :action => "completed"
    )
  end
end
