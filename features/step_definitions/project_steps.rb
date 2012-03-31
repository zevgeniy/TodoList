### GIVEN ###
Given /^I have project "([^"]*)" and task list "([^"]*)" in it$/ do |arg1, arg2|
  click_link("Add project")
  sleep(2)
  fill_in "project_name", :with=>arg1
  click_button "Add"
  wait_until { page.has_content? arg1 }
  
  click_link(arg1)
  click_link("Add task list")
  sleep(2)
  fill_in "list_name", :with=>arg2
  click_button "Add"
  wait_until { page.has_content? arg2 }
end


### WHEN ###
When /^I visit link "(.*)"$/ do |link|
  visit link
end

When /^I click on button "(.*)"$/ do |button|
  click_button button
end

When /^I click on link "(.*)"$/ do |link|
  click_link(link)
  sleep(2)
end

When /^I fill in project name$/ do
  fill_in "project_name", :with=>"Home project"
end

When /^I click on settings link near this project$/ do
   find("#project#{Project.last.id} .b-dropdown-handle", :text=>"+").click
end

When /^I click on menu Delete$/ do
  page.evaluate_script('window.confirm = function() { return true; }')
  find(".b-dropdown-link", :text => "Delete").click
end

When /^I created new project and sign out$/ do
  click_link"Add project"
  fill_in "project_name", :with=>"Home project"
  click_button "Add"
  click_link "Sign out"
end

When /^I fill in new name$/ do
  fill_in "project_name", :with=>"Another project"
end

When /^I as another user signed in$/ do
  pending "in progress...."
  sign_up second_user
  sign_in second_user
end

When /^I create project$/ do
	click_link "Add project"
	
  sleep(2)
  fill_in "project_name", :with=>"Home project"
  click_button "Add"
  
  wait_until { page.has_content? "Home project" }
end

When /^I create second project$/ do
	click_link("Add project")
  fill_in "project_name", :with=>"Work tasks"
  click_button "Add"
end

When /^I open this project$/ do
  click_link(Project.last.name)	
end

When /^I have one project$/ do
  user = User.last
  project = Project.new(name:"One", user_id:user.id)
  user.projects << project
end
### THEN ###
Then /^this project is displayed on the page$/ do
  page.should have_content "Home project"
end

Then /^this project should disappear$/ do
  page.should have_content "Sign out"
  page.should_not have_content "Home project"
end

Then /^I should see "(.*)"$/ do |message| 
  page.should have_content message
end

Then /^I see the message "(.*)"$/ do |message|
  page.should have_content message
end

Then /^I should not see "(.*)"$/ do |message|
	page.should_not have_content message
end

Then /^I should not see created task list$/ do
	page.should_not have_content "online tasks"
end

Then /^I should see project with updated name$/ do
  page.should_not have_content "Home project"
  
  page.should have_content "Another project"
end

