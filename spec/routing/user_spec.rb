require 'spec_helper'

describe 'routing to user' do
  it 'routes /signup to users#new' do
    { :get => "/signup" }.should route_to(
      :controller => "users",
      :action => "new"
    )
  end
  
  it 'routes post /signup to users#create' do
    { :post => "/signup" }.should route_to(
      :controller => "users",
      :action => "create"
    )
  end
  
end
