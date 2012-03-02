require 'spec_helper'

describe 'routing to session' do
  it 'routes /signin to sessions#new' do
    { :get => "/signin" }.should route_to(
      :controller => "sessions",
      :action => "new"
    )
  end
  
  it 'routes post /signin to sessions#create' do
    { :post => "/signin" }.should route_to(
      :controller => "sessions",
      :action => "create"
    )
  end
  
  it 'routes /signout to sessions#destroy' do
    { :get => "/signout" }.should route_to(
      :controller => "sessions",
      :action => "destroy"
    )
  end
end
