Sure, here are multiple BDD scenarios in Gherkin syntax based on the given text:


Feature: View User Usage Statistics
  As an administrator
  I want to see statistics of how much time each user uses the platform
  So that I can monitor user engagement and activity levels

  Scenario 1: Administrator views usage statistics for all users
    Given I am logged in as an administrator
    When I navigate to the user statistics page
    Then I should see a list of all users
    And I should see the total time each user has spent on the platform

  Scenario 2: Administrator views usage statistics for a specific user
    Given I am logged in as an administrator
    And I am on the user statistics page
    When I search for a specific user by username
    Then I should see the total time that user has spent on the platform

  Scenario 3: Administrator views usage statistics within a specific date range
    Given I am logged in as an administrator
    And I am on the user statistics page
    When I filter the statistics by a specific date range
    Then I should see the total time each user has spent on the platform within that date range

  Scenario 4: Administrator exports usage statistics
    Given I am logged in as an administrator
    And I am on the user statistics page
    When I click the export button
    Then I should be able to download the usage statistics as a CSV file

  Scenario 5: Administrator views real-time usage statistics
    Given I am logged in as an administrator
    And I am on the user statistics page
    When I enable real-time statistics
    Then I should see the current session time for each user who is currently online

  Scenario 6: Administrator sees a summary of total platform usage
    Given I am logged in as an administrator
    When I navigate to the user statistics page
    Then I should see a summary of the total time all users have spent on the platform combined


These scenarios cover different aspects of viewing and interacting with user usage statistics for an administrator.