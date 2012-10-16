Feature: Validate a guess
  As an admin
  I want to validate guesses once payment has been made
  So that I can make those guesses display on the map

  Background:
    Given there are the following guesses:
      | name | email                | message     | latitude          | longitude         |
      | Dane | yaktracker@gmail.com | OMG! IRAN!! | 34.23474636626753 | 54.44402749999995 |
    And I am on the validate guess page

  Scenario: The guess should be validated
    When I set a guess to validated
    Then I should see that the guess is now valid

  Scenario: Guess winnings should increase
    When I set a guess to validated
    And I go to the home page
    Then I should see "$5" as the total pool

  Scenario: Use the wrong password to validate
    When I attempt to set a guess to validated with the wrong password
    Then I should see the wrong password message
