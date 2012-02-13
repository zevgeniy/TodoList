require "spec_helper"

describe List do
  
  context "assotiations" do
    it { should have_many(:tasks) }
    it { should belong_to(:project) }
  end
  
  context "Release, step 1" do
    before(:all) do
      @user = User.new valid_attributes_user
      @user.save!
      @project = Project.new valid_attributes_project
      @user.projects << @project
      @project.
    end
    
    it "should create task list" do
      
    end
  end
  
  context "valid attributes" do  
    before(:each) do
      @list = List.new valid_attributes
    end
    
    it "should require name" do
      @list.name = nil
      @list.should_not be_valid
    end
  end
  def valid_attributes
    {:name=>"online", :description=>"desc"}
  end
end
