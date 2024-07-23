# Feature: View flight statistics

  Scenario 1: Admin views flight statistics successfully
    Given the admin is logged into the admin dashboard
    When the admin navigates to the "Flight Statistics" page
    Then the admin should see a list of flight statistics
    And the list should include the most popular destinations

  Scenario 2: Admin filters flight statistics by date range
    Given the admin is logged into the admin dashboard
    And flight statistics are available
    When the admin navigates to the "Flight Statistics" page
    And the admin selects a specific date range
    Then the admin should see the flight statistics filtered by the selected date range
    And the list should include the most popular destinations within that date range

  Scenario 3: Admin exports flight statistics
    Given the admin is logged into the admin dashboard
    And flight statistics are available
    When the admin navigates to the "Flight Statistics" page
    And the admin clicks on the "Export" button
    Then the admin should be able to download the flight statistics as a file
    And the exported file should include the most popular destinations


These remaining scenarios cover successful viewing, filtering by date, and exporting flight statistics.