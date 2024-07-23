# Feature: Cancel Scheduled Flight
  As a user, I want to be able to cancel my scheduled flight when I open the details about it.

  Scenario 1: Open flight details page
    Given I am a logged-in user
    And I have a scheduled flight
    When I navigate to my scheduled flights section
    And I select a specific flight
    Then I should see the flight details page

  Scenario 2: Cancel button is visible
    Given I am on the flight details page of a scheduled flight
    When the page loads completely
    Then I should see a "Cancel Flight" button

  Scenario 3: Successful flight cancellation
    Given I am on the flight details page of a scheduled flight
    When I click on the "Cancel Flight" button
    And I confirm the cancellation
    Then I should see a confirmation message indicating the flight has been cancelled
    And the flight should no longer appear in my scheduled flights list

  Scenario 4: Cancel flight without confirmation
    Given I am on the flight details page of a scheduled flight
    When I click on the "Cancel Flight" button
    And I do not confirm the cancellation
    Then the flight should remain in my scheduled flights list
    And I should not see any cancellation confirmation message

  Scenario 5: Error in flight cancellation
    Given I am on the flight details page of a scheduled flight
    When I click on the "Cancel Flight" button
    And there is an error in the cancellation process
    Then I should see an error message indicating the flight could not be cancelled
    And the flight should remain in my scheduled flights list


Each scenario covers different aspects of the user story, ensuring comprehensive test coverage for the flight cancellation feature.