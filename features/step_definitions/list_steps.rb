#### GIVEN ####
Given /^I have a project "(.*)" and a task list "(.*)" in it$/ do|arg1, arg2|
  click_link "Add project"
  sleep(2)
  fill_in "project_name", :with=>arg1
  click_button "Add"
  	
  click_link arg1
  click_link "Add task list"
  sleep(2)
  
  fill_in "list_name", :with=>arg2
  click_button "Add"
end

#### WHEN ####
When /^I create task list$/ do
	find('.button', :text=>"Add task list").click
  fill_in "list_name", :with=>"online tasks"
  click_button "Add"
end

When /^I create task list "(.*)"$/ do |name|
  find('.button', :text=>"Add task list").click
  fill_in "list_name", :with=>name
  click_button "Add"
end

When /^I open this task list$/ do
  click_link List.last.name
end

When /^I open task list "(.*)"$/ do |name|
  find("#task-list#{List.select(:id).find_by_name(name).id} a", :text=>name).click
end

When /^I fill in task list's name and description$/ do
	fill_in "list_name", :with=>"online tasks"
	fill_in "list_description", :with=>"desc for task list"
end

When /^I click on settings link near this task list$/ do
  find("#task-list#{List.last.id} .b-dropdown-handle", :text=>"+").click
end

When /^I fill in new name and description$/ do
  fill_in "list_name", :with=>"offline"
	fill_in "list_description", :with=>"another description"
end

When /^I click on menu Edit$/ do
  find(".b-dropdown-link", :text => "Edit").click
end

#### THEN ####
Then /^I should see project with updated name and description$/ do
  page.should_not have_content "online tasks"
  page.should_not have_content "desc for task list"
  
  page.should have_content "offline"
  page.should have_content "another description"
end

Then /^I should not see this task list on page$/ do
  page.should_not have_content "online tasks"
  page.should_not have_content "desc for task list"
end
