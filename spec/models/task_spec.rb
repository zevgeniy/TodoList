require "spec_helper"

describe Task do
  
  context "assotiations" do
   it { should have_and_belong_to_many(:users) }
   it { should belong_to(:list) }
  end 
  
  before(:each) do
    @task = Task.new valid_attributes
  end
  
  it "should require name" do
    @task.name = nil
    @task.should_not be_valid
  end

  def valid_attributes
    {:name=>"buy bear", :description=>"at 5pm", :state=>false, :priority=>3}
  end
end
