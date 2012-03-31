@selenium 
@javascript
Feature: Create task list
  As a user I want to be able to create task lists and to call them (the task list has a name and description)

  Scenario: User create task list
    Given I exist as a user and signed in
	  And I create project
	  And I open this project
	 When I click on link "Add task list"
	  And I fill in task list's name and description
	  And I click on button "Add"
	 Then I should see "online tasks"
	  And I should see "desc for task list"
			
  Scenario: User delete task list
    Given I exist as a user and signed in
      And I have one project and a task list in it
     When I click on settings link near this task list
      And I click on menu Delete
     Then I should not see this task list on page
      And I should see "Task lists:"
      
  Scenario: User update task list
    Given I exist as a user and signed in
      And I have one project and a task list in it
     When I click on settings link near this task list
      And I click on menu Edit
      And I fill in new name and description
      And I click on button "Update"
     Then I should see project with updated name and description
