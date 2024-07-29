# Feature: Password recovery on the login page

  Scenario 1: Display "Forgot password" button on the login page
    Given the user is on the login page
    When the page loads
    Then the user should see a button labeled "Forgot password"

  Scenario 2: Navigate to password recovery page
    Given the user is on the login page
    And the "Forgot password" button is visible
    When the user clicks the "Forgot password" button
    Then the user should be redirected to the password recovery page

  Scenario 3: Display password recovery form on password recovery page
    Given the user is on the password recovery page
    When the page loads
    Then the user should see a form to enter their email address or username

  Scenario 4: Submit password recovery form with valid email
    Given the user is on the password recovery page
    And the user has entered a valid email address
    When the user submits the password recovery form
    Then the user should see a confirmation message indicating that password recovery instructions have been sent

  Scenario 5: Submit password recovery form with invalid email
    Given the user is on the password recovery page
    And the user has entered an invalid email address
    When the user submits the password recovery form
    Then the user should see an error message indicating that the email address is not valid

  Scenario 6: Submit password recovery form with non-existent email
    Given the user is on the password recovery page
    And the user has entered an email address that does not exist in the system
    When the user submits the password recovery form
    Then the user should see an error message indicating that the email address is not found

  Scenario 7: Receive password recovery email
    Given the user has submitted the password recovery form with a valid email address
    When the system processes the request
    Then the user should receive an email with instructions to reset their password

  Scenario 8: Reset password using the link from the email
    Given the user has received a password recovery email
    And the email contains a link to reset the password
    When the user clicks the link in the email
    Then the user should be redirected to a page to enter a new password

  Scenario 9: Successfully reset password
    Given the user is on the password reset page
    And the user has entered a new password
    And the user has confirmed the new password
    When the user submits the new password form
    Then the user should see a confirmation message indicating that the password has been successfully reset
    And the user should be able to log in with the new password