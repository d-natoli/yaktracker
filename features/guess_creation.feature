Feature: Create a guess
  As a visitor to the website
  I want to make a guess
  so that I can win a shitload of money

  Scenario: Submit a valid guess
    Given I am on the new guess screen
    And I submit a valid guess
    Then I should see the guess created message

  Scenario: Submit an invalid guess
    Given I am on the new guess screen
    And I submit an invalid guess
    Then I should see the guess failed message
    And I should see the errors for that guess
