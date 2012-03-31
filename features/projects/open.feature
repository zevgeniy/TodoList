@selenium 
@javascript
Feature: Open project
	As a user I want to see task lists when I click on project

	Scenario: User open the project and see his task lists
		Given I exist as a user and signed in
		 When I create project
		  And I open this project
		 Then I should see "Task lists:"

	Scenario: User don't click on any project
	  Given I exist as a user and signed in
     Then I should not see "Task lists:"
		 When I create project
		 Then I should not see "Task lists:"

  Scenario: User create task list in one of two projects
    Given I exist as a user and signed in
     When I create project
      And I open this project
			And I create task list
      And I create second project
      And I open this project
     Then I should not see created task list
     
  Scenario: User enter project's link into browser
    Given I exist as a user and signed in
      And I have one project
     When I visit link "/projects/1"
     Then I should see "Task lists:"
