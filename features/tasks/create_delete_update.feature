@selenium 
@javascript
Feature: Create/Delete/Update task
  As a user I want to be able to create / delete / update task
  
  Background:
     Given I exist as a user and signed in
      And I have project "Home" and task list "First" in it
     When I open this project
      And I open this task list
      And I click on link 'Add task'
      And I fill in task name
      And I click on button "Add"
        
  Scenario: User create a task
     Then I should see this task on page
     
  Scenario: User delete the task
     When I click on settings link near task
      And I click on menu Delete
     Then I should not see this task
      And I should see tasks column
  
  Scenario: User update the task
     When I click on settings link near task
      And I click on menu Edit
      And I fill in task's attributes
      And I click on button "Update"
     Then I should see task with updated attributes
     

