# Feature: Google Search
  As a web surfer,
  I want to search Google,
  So that I can learn new things.

  Scenario 1: Successful Google search
    Given I am on the Google homepage
    When I enter a search term in the search bar
    And I click the "Google Search" button
    Then I should see search results related to my search term

  Scenario 2: Search with empty input
    Given I am on the Google homepage
    When I leave the search bar empty
    And I click the "Google Search" button
    Then I should see a message indicating that the search term is required

  Scenario 3: Search with special characters
    Given I am on the Google homepage
    When I enter special characters (e.g., "@#$%") in the search bar
    And I click the "Google Search" button
    Then I should see search results related to the special characters

  Scenario 4: Search using voice input
    Given I am on the Google homepage
    When I click the microphone icon in the search bar
    And I speak a search term
    Then I should see search results related to the spoken search term

  Scenario 5: Search with auto-suggestions
    Given I am on the Google homepage
    When I start typing a search term in the search bar
    Then I should see auto-suggestions related to my partial search term
    And I can select an auto-suggestion to complete my search