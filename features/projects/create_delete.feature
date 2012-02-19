Feature: Create/Delete project
  As a user I want to be able to create / delete projects, the project includes a list of tasks.
    Background:
      Given I exist as a user
        And I signed in

    Scenario: Create project
      When I click on link "Add project"
        And I fill in project name
        And I click on button "Add"
      Then this project is displayed on the page
      
    Scenario: Remove project
      When I click on link "Add project"
        And I fill in project name
        And I click on button "Add"
        And I click on settings link
        And I click on menu Delete
      Then this project should disappear
