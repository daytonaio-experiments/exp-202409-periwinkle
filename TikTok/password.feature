# Feature: Password Change

  Scenario 1: User successfully changes password
    Given the user is logged in
    And the user is on the account settings page
    When the user enters the current password correctly
    And the user enters a new valid password
    And the user confirms the new password correctly
    Then the system should update the password
    And the user should see a confirmation message

  Scenario 2: User enters incorrect current password
    Given the user is logged in
    And the user is on the account settings page
    When the user enters the incorrect current password
    And the user enters a new valid password
    And the user confirms the new password correctly
    Then the system should not update the password
    And the user should see an error message indicating the current password is incorrect

  Scenario 3: User enters mismatched new password and confirmation password
    Given the user is logged in
    And the user is on the account settings page
    When the user enters the current password correctly
    And the user enters a new valid password
    And the user enters a confirmation password that does not match the new password
    Then the system should not update the password
    And the user should see an error message indicating the passwords do not match

  Scenario 4: User leaves new password field empty
    Given the user is logged in
    And the user is on the account settings page
    When the user enters the current password correctly
    And the user leaves the new password field empty
    And the user confirms the new password correctly
    Then the system should not update the password
    And the user should see an error message indicating the new password is required

  Scenario 5: User leaves confirmation password field empty
    Given the user is logged in
    And the user is on the account settings page
    When the user enters the current password correctly
    And the user enters a new valid password
    And the user leaves the confirmation password field empty
    Then the system should not update the password
    And the user should see an error message indicating the confirmation password is required

  Scenario 6: User enters a new password that does not meet security requirements
    Given the user is logged in
    And the user is on the account settings page
    When the user enters the current password correctly
    And the user enters a new password that does not meet the security requirements
    And the user confirms the new password correctly
    Then the system should not update the password
    And the user should see an error message indicating the security requirements for the new password


Each scenario addresses a different aspect of the password change process, ensuring comprehensive coverage of possible user interactions and system responses.