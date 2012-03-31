@wip
@selenium
@javascript

Feature: Complete the task
  As a user I want to be able to change task's status (complete/incomplete)
  
  Background:
    Given I exist as a user and signed in
      And I have project "Home", task list "First" and task "Buy beer" with description "desc"
      And I visit link "/projects/1/lists/1"
      
  Scenario: User completes the task
     When I click on checkbox near the task
     Then I should see "You don't have any tasks in this task list!"
      
  Scenario: User browses completed tasks
    Given I click on checkbox near the task
     When I click on link "Show completed tasks" 
     Then I should see "Buy beer"
     
  Scenario: User resume task
    Given I click on checkbox near the task
     When I click on link "Show completed tasks"
      And I click on checkbox near completed task
     Then I should not see "You don't have any tasks in this task list!"
