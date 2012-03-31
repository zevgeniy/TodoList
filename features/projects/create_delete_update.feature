@selenium 
@javascript
Feature: Create/Delete/Update project
  As a user I want to be able to create / delete / update projects
  
    Background:
      Given I exist as a user and signed in
	
    Scenario: User create project
      When I click on link "Add project"
        And I fill in project name
        And I click on button "Add"
      Then this project is displayed on the page
    
    Scenario: User delete project
      When I create project
        And I click on settings link near this project
        And I click on menu Delete
      Then this project should disappear

    Scenario: User open project and then delete it
	  When I create project
	   And I open this project
	   And I click on settings link near this project
	   And I click on menu Delete
	Then I should not see "Task lists:"
			
	  Scenario: User update project
	    When I create project
	     And I click on settings link near this project
	     And I click on menu Edit
	     And I fill in new name
	     And I click on button "Update"
	    Then I should see project with updated name
