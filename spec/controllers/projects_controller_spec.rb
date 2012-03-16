require 'spec_helper'
include Devise::TestHelpers

describe ProjectsController do

	
  before { controller.stub(:authenticate_user!).and_return true }

	describe "GET my" do

		it "should return array" do
			current_user = double("user")
			@project = Project.new()
			current_user.should_receive(:my_projects).and_return([@project,@project])
			get :my
		end
  
	end

	describe "GET foreign" do
		it "should return array" do
			current_user = double("user")
			@project = Project.new()
			current_user.should_receive(:foreign_projects).and_return([@project,@project])
			get :foreign
		end
	end
  

end
