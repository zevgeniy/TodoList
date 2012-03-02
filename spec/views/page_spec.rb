require 'spec_helper'

describe 'main/_page.html.haml' do
  it "render _project pertial for each project" do
    pending 'incomplete test'
   assign(:projects,[stub_model(Project), stub_model(Project)])
   render
   view.should render_template(:partial=>"_project", :count=>2) 
  end
end
