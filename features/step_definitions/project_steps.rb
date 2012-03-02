### GIVEN ###


### WHEN ###
When /^I click on button "(.*)"$/ do |button|
  click_button button
end

When /^I click on link "(.*)"$/ do |link|
  find('.button', :text=>link).click
end

When /^I fill in project name$/ do
  fill_in "projects_name", :with=>"Home project"
end

When /^I click on settings link$/ do
   find("#plusPr#{Project.last.id}", :text=>"+").click
end

When /^I click on menu Delete$/ do
  find(".b-dropdown-link", :text => "Delete").click
end

When /^I created new project and sign out$/ do
  find('.button', :text=>"Add project").click
  fill_in "projects_name", :with=>"Home project"
  click_button "Add"
  find('a', :text=>"Sign out").click
end

When /^I as another user signed in$/ do
  sign_up second_user
  sign_in second_user
end

When /^I have one project$/ do
  user = User.last
  project = Project.new(name:"One", user_id:user.id)
  user.projects << project
end

### THEN ###
Then /^this project is displayed on the page$/ do
  page.should have_content "Task lists:"
end

Then /^this project should disappear$/ do
  page.should have_content "Sign out"
  page.should_not have_content "Home project"
end

Then /^I see the message "(.*)"$/ do |message|
  page.should have_content message
end



