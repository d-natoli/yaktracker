Feature: Show total pool
  As a visitor to the website
  I want to see the amount I can win
  So that I can decide to bet or not

  Scenario: Show pool amount
    Given there are the following guesses:
      | name | email                | message     | latitude          | longitude         | paid  |
      | Dane | yaktracker@gmail.com | OMG! IRAN!! | 34.23474636626753 | 54.44402749999995 | true  |
      | Dave | dave@gmail.com       | Yay!        | 34.23474636626753 | 54.44402749999995 | true  |
      | Rach | rach@gmail.com       | I hate you! | 34.23474636626753 | 54.44402749999995 | false |
    And I go to the home page
    Then I should see "$10" as the total pool
