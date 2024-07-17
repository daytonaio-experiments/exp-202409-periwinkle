# Feature: Customer App Usage Statistics

  Scenario 1: Admin views overall customer app usage statistics
    Given I am logged in as an admin
    When I navigate to the "Usage Statistics" page
    Then I should see the overall app usage statistics for all customers

  Scenario 2: Admin filters app usage statistics by date range
    Given I am logged in as an admin
    And I am on the "Usage Statistics" page
    When I select a date range filter
    Then I should see the app usage statistics for customers within the selected date range

  Scenario 3: Admin views app usage statistics for individual customers
    Given I am logged in as an admin
    And I am on the "Usage Statistics" page
    When I select a specific customer from the customer list
    Then I should see the app usage statistics for the selected customer

  Scenario 4: Admin exports app usage statistics
    Given I am logged in as an admin
    And I am on the "Usage Statistics" page
    When I click on the "Export" button
    Then I should be prompted to download the app usage statistics as a CSV file

  Scenario 5: Admin views app usage statistics in graphical format
    Given I am logged in as an admin
    And I am on the "Usage Statistics" page
    When I choose to view the statistics in graphical format
    Then I should see the app usage statistics displayed as graphs

  Scenario 6: Admin receives an error when the usage statistics page fails to load
    Given I am logged in as an admin
    When I navigate to the "Usage Statistics" page
    And the page fails to load
    Then I should see an error message indicating the failure to load the statistics

  Scenario 7: Admin views real-time app usage statistics
    Given I am logged in as an admin
    And I am on the "Usage Statistics" page
    When I enable real-time updates
    Then I should see the app usage statistics updating in real-time


These scenarios cover various aspects of viewing, filtering, exporting, and handling errors related to customer app usage statistics from an admin perspective.