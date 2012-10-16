Feature: Send email on guess creation
  On creation of a new guess
  An email should be sent to the user

  Background:
    Given I am on the new guess screen
    And a clear email queue 
    And I submit a valid guess
 
  Scenario: Send an email on new guess
    Then "steve@gmail.com" should receive an email

  Scenario: Email is also sent to me
    Then "yaktracker@gmail.com" should receive an email
