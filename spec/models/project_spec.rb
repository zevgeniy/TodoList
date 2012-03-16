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

	context "#author" do
		it "should return user who created current project" do
			@user = User.new valid_attributes_user
			@user.save
			@project = Project.new valid_attributes_project
			@user.projects << @project
			@user.shares.last.update_attributes(:author=>true)
			@project.author.should == @user
		end
	end

end
