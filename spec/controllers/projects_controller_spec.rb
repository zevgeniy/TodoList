require 'spec_helper'

describe ProjectsController do

  def do_create 
    post :create, :post=>{:name => 'First project'}
  end
  
  

end
