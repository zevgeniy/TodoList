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
  user = User.new(:login=>"Sam", :email=>"Sam@mail.ru", :password=>"123456", :password_confirmation=>"123456")
  sign_up user 
  sign_in user
end

### THEN ###
Then /^this project is displayed on the page$/ do
  page.should have_content "Task's list:"
end

Then /^this project should disappear$/ do
  page.should have_content "Sign out"
  page.should_not have_content "Home project"
end

Then /^I see the message (.*)$/ do |message|
  page.should have_content message
end



