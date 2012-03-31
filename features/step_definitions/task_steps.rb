#### GIVEN ####
Given /^I have project "(.*)", task list "(.*)" and task "(.*)" with description "(.*)"$/ do |arg1, arg2, arg3, arg4|
  user = User.last
  project = user.projects.create(name:arg1, user_id:User.last.id)
  user.shares.last.update_attributes(:author=>true)
  list = project.lists.create(name:arg2, project_id:Project.last.id)
  list.tasks.create(name:arg3, description:arg4, list_id:List.last.id)
end

#### WHEN ####
When /^I click on checkbox near the task$/ do
  find("#checkbox_#{Task.last.id}").click
end

When /^I click on checkbox near completed task$/ do
  find("#completed-task#{Task.last.id}").find("[type=checkbox]").click
end

When /^I create task "(.*)"$/ do |name|
  find("#tasks a.button", :text=>"Add task").click
  fill_in "task_name", :with=>name
  click_button "Add"
end

When /^I fill in task name$/ do
  fill_in "task_name", :with=>"go to the department store"
end

When /^I click on settings link near task$/ do
  find("#task#{Task.last.id} .b-dropdown-handle", :text=>"+").click
end

When /^I fill in task's attributes$/ do
  fill_in "task_name", :with=>"buy bear"
  fill_in "task_description", :with=>"in shop"
end

When /^I click on link 'Add task'$/ do
  click_link("Add task")
  sleep(2)
end

#### THEN ####
Then /^I should see task with updated attributes$/ do
  page.should_not have_content "go to the department store"
  
  page.should have_content "buy bear"
  page.should have_content "in shop"
end

Then /^I should see this task on page$/ do
  page.should have_content Task.last.name
end

Then /^I should not see this task$/ do
  page.should_not have_content "go to the department store"
end

Then /^I should see tasks column$/ do
  page.should have_content "Tasks:"
  page.should have_content "Show completed tasks"
end
