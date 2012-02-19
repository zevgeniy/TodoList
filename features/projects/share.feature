Feature: Share project
  As a user I want to be able to invite others into their projects.
  
  Scenario: The user can not see the projects of another user, if it is not share their
    Given I exist as a user
      And I signed in
    When I created new project and sign out
      And I as another user signed in
    Then I see the message "You don't have any projects!"
      
