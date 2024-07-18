# Feature: User Login and Password Change

  Scenario 1: User enters incorrect credentials and is prompted to change password
    Given the user is on the login page
    When the user enters incorrect credentials
    And the user clicks the login button
    Then the user should see an error message indicating incorrect credentials
    And the user should see an option to change their password

  Scenario 2: User selects the option to change password after entering incorrect credentials
    Given the user is on the login page
    When the user enters incorrect credentials
    And the user clicks the login button
    And the user sees an option to change their password
    Then the user clicks on the change password option
    And the user should be redirected to the change password page

  Scenario 3: User successfully changes password after entering incorrect credentials
    Given the user is on the change password page
    When the user enters a valid new password
    And the user confirms the new password
    And the user clicks the submit button
    Then the user should see a confirmation message that the password has been changed successfully

  Scenario 4: User enters mismatched passwords on change password page
    Given the user is on the change password page
    When the user enters a new password
    And the user enters a different password in the confirm password field
    And the user clicks the submit button
    Then the user should see an error message indicating that the passwords do not match

  Scenario 5: User leaves the new password field blank on change password page
    Given the user is on the change password page
    When the user leaves the new password field blank
    And the user clicks the submit button
    Then the user should see an error message indicating that the new password field is required

  Scenario 6: User leaves the confirm password field blank on change password page
    Given the user is on the change password page
    When the user enters a new password
    And the user leaves the confirm password field blank
    And the user clicks the submit button
    Then the user should see an error message indicating that the confirm password field is required

  Scenario 7: User enters a new password that does not meet complexity requirements
    Given the user is on the change password page
    When the user enters a new password that does not meet the complexity requirements
    And the user clicks the submit button
    Then the user should see an error message indicating the password complexity requirements


These scenarios cover different aspects of the user's journey from entering incorrect login credentials to successfully changing their password.