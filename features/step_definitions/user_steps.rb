def valid_user
  @user = {:password=>"123456", :password_confirmation=>"123456", :email=>"din@gmail.com"}
end

def second_user
  @user = {:password=>"123456", :password_confirmation=>"123456", :email=>"cap@gmail.com"}
end

def sign_up user
  visit '/users/sign_up'
  fill_in "user_email", :with=>user[:email]
  fill_in "user_password", :with=>user[:password]
  fill_in "user_password_confirmation", :with=>user[:password_confirmation]
  click_button "Sign up"
end

def sign_in user
  visit '/users/sign_in'
	page.should have_content "Email"
  fill_in 'user_email', :with => user[:email]
  fill_in 'user_password', :with => user[:password]
  click_button "Sign in"
end

### GIVEN ###
Given /^I signed in$/ do
  sign_in valid_user
end

Given /^I do not exist as a user$/ do
  User.find(:first, :conditions => {:email=>valid_user[:email]}).should be_nil
  visit '/users/sign_out'
end

Given /^I signed out$/ do
	find('a', :text=>"Sign out").click
end

Given /^I exist as a user$/ do
  sign_up valid_user
end

### WHEN ###
When /^I sign in with valid credentials$/ do
  sign_in valid_user
end

When /^I sign in with a wrong password$/ do
  user = valid_user.merge(:password=>"654321")
	sign_in user
end

### THEN ###
Then /^I should be signed out$/ do
  page.should have_content "Sign up"
  page.should have_content "Email"
  page.should_not have_content "Sign out"
end


Then /^I see an invalid message$/ do
  page.should have_content "Sign in"
  page.should_not have_content "Sign out"
end


Then /^I see main page$/ do
  page.should have_content valid_user[:email]
  page.should have_content "You don't have any projects!"

  page.should_not have_content "Sign in"
end
