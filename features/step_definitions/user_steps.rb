def valid_user
  @user ||= {:login=>"Din", :password=>"123456", :password_confirmation=>"123456", :email=>"Din@gmail.com"}
end

def sign_up user
  visit '/signup'
  fill_in "Login", :with=>user[:login]
  fill_in "Email", :with=>user[:email]
  fill_in "Password", :with=>user[:password]
  fill_in "Password confirmation", :with=>user[:password_confirmation]
  click_button "Sign up!"
end

def sign_in user
  visit '/signin'
  fill_in "Login/email", :with => user[:email]
  fill_in "Password", :with => user[:password]
  click_button "Sign in"
end

### GIVEN ###
Given /^I signed in$/ do
  sign_in valid_user
end

Given /^I do not exist as a user$/ do
  User.find(:first, :conditions => {:email=>valid_user[:email]}).should be_nil
  visit '/signout'
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
  page.should have_content "Login/email"
  page.should_not have_content "Sign out"
end


Then /^I see an invalid message$/ do
  page.should have_content "Invalid login or password!"
  page.should_not have_content "Sign out"
end


Then /^I see main page$/ do
  page.should have_content valid_user[:login]
  page.should have_content "You don't have any projects!"

  page.should_not have_content "Sign in"
end