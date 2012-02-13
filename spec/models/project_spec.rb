require "spec_helper"

describe Project do
  
  context "assotiations" do
    it { should have_many(:lists) }
    it { should have_many(:users).through(:shares) }
    it { should have_many(:shares) }
  end
  
  context "valid attributes" do  
    before(:each) do
      @project = Project.new valid_attributes_project
    end
    
    it "should require name" do
      @project.name = nil
      @project.should_not be_valid
    end  
  end

end
