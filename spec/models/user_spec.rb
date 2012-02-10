require "spec_helper"
require "valid_data"
describe User do
  
  context "assotiations" do 
  
    it { should have_many(:projects).through(:shares) }
    it { should have_many(:shares) }
    it { should have_and_belong_to_many(:tasks) }
  end
  
  context "valid attributes" do
    before(:each) do  
      @user = User.new valid_attributes_user 
    end
    
    it "should require password" do    
      @user.password = nil
      @user.should_not be_valid
    end 
    
    it "should require login" do
      @user.login = nil
      @user.should_not be_valid
    end
    
    it "should require email" do
      @user.email = nil
      @user.should_not be_valid
    end
  end
  
  context "#authenticate" do
  
    it "should return user when login and password is correct" do
      user = User.new valid_attributes_user
      user.save!
      
      user2 = User.authenticate "admin", "654357876"
      user.should_not == user2
      
      user2 = User.authenticate "admin", "123456"
      user.should == user2
    end
  
  end
end
