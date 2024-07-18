# Feature: Profile Description Update

  Scenario 1: Successfully changing profile description
    Given the user is logged into their account
    And the user is on the profile settings page
    When the user enters a new profile description
    And the user clicks the "Save" button
    Then the profile description should be updated
    And a confirmation message "Profile updated successfully" should be displayed

  Scenario 2: Attempting to change profile description without logging in
    Given the user is not logged into their account
    When the user tries to access the profile settings page
    Then the user should be redirected to the login page
    And a message "Please log in to access profile settings" should be displayed

  Scenario 3: Changing profile description with an empty field
    Given the user is logged into their account
    And the user is on the profile settings page
    When the user clears the profile description field
    And the user clicks the "Save" button
    Then the profile description should not be updated
    And an error message "Profile description cannot be empty" should be displayed

  Scenario 4: Changing profile description with special characters
    Given the user is logged into their account
    And the user is on the profile settings page
    When the user enters a new profile description with special characters
    And the user clicks the "Save" button
    Then the profile description should be updated
    And a confirmation message "Profile updated successfully" should be displayed

  Scenario 5: Updating profile description with a very long text
    Given the user is logged into their account
    And the user is on the profile settings page
    When the user enters a profile description that exceeds the maximum length allowed
    And the user clicks the "Save" button
    Then the profile description should not be updated
    And an error message "Profile description is too long" should be displayed