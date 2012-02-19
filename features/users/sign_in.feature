Feature: Sign in
  In order to get access to protected sections of the site
  A user
  Should be able to sign in

    Scenario: User is not signed up
      Given I do not exist as a user
      When I sign in with valid credentials
      Then I should be signed out

    Scenario: User enters wrong password
      Given I exist as a user
      When I sign in with a wrong password
      Then I see an invalid message
        And I should be signed out

    Scenario: User is login with valid data
      Given I exist as a user
      When I sign in with valid credentials
      Then I see main page
