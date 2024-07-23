# Feature: Change Profile Description

  Scenario 1: User navigates to the profile page
    Given the user is logged into their account
    When the user clicks on the profile icon
    Then the user should be navigated to the profile page

  Scenario 2: User sees the current profile description
    Given the user is on the profile page
    When the profile page is loaded
    Then the user should see their current profile description

  Scenario 3: User clicks to edit the profile description
    Given the user is on the profile page
    And the user sees their current profile description
    When the user clicks the edit button next to the profile description
    Then the user should see a text input field with their current profile description

  Scenario 4: User successfully updates the profile description
    Given the user is on the profile page
    And the user has clicked the edit button next to the profile description
    And the user sees a text input field with their current profile description
    When the user enters a new profile description into the text input field
    And the user clicks the save button
    Then the user should see a confirmation message indicating the profile description was updated successfully
    And the profile page should display the new profile description

  Scenario 5: User cancels updating the profile description
    Given the user is on the profile page
    And the user has clicked the edit button next to the profile description
    And the user sees a text input field with their current profile description
    When the user clicks the cancel button
    Then the text input field should disappear
    And the profile page should display the original profile description

  Scenario 6: User tries to save an empty profile description
    Given the user is on the profile page
    And the user has clicked the edit button next to the profile description
    And the user sees a text input field with their current profile description
    When the user clears the text input field
    And the user clicks the save button
    Then the user should see an error message indicating that the profile description cannot be empty
    And the profile description should not be updated