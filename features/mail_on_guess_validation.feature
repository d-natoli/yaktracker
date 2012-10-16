Feature: Send email on guess validation
  On validation of a new guess
  An email should be sent to the user

  Background:
    Given there are the following guesses:
      | name | email           | message     | latitude          | longitude         |
      | Dane | steve@gmail.com | OMG! IRAN!! | 34.23474636626753 | 54.44402749999995 |
    And a clear email queue 
    And I am on the validate guess page
    When I set a guess to validated
 
  Scenario: Send an email on validated guess
    Then "steve@gmail.com" should receive an email

  Scenario: Email is also sent to me
    Then "yaktracker@gmail.com" should receive an email
