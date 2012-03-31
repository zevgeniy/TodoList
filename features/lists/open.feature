@selenium
@javascript
Feature: Open task list
  As a user I want to see tasks when I click on task list
  
  Background:
    Given I exist as a user and signed in
      And I have project "Home" and task list "First" in it
     When I open this project
     
  Scenario: User click on task list
    When I open task list "First"
    Then I should see "You don't have any tasks in this task list!"
    
  Scenario: User don't click on task list
    Then I should not see "You don't have any tasks in this task list!"

  Scenario: User create task in one of two task lists and open one of them
    When I open task list "First"
     And I create task "Buy beer"
     And I create task list "Second"
     And I open task list "Second"
    Then I should not see "Buy beer"
   
  Scenario: User enter task list's link in to browser
    When I visit link "/projects/1/lists/1"
    Then I should see "You don't have any tasks in this task list!"
     And I should see "First"
     And I should see "Home"

    
