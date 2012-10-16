Feature: Clear cache
  I want to be able to clear the cache when I go to this page

  Scenario: Clear the cache
    Given I store a value in the cache
    When I visit the clear cache page
    Then the value shouldn't be stored in the cache anymore
