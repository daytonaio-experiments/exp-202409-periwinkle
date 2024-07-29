# Feature: Password Reset on Login Page

  Scenario 1: User navigates to the password reset page from the login page
    Given the user is on the login page
    When the user clicks on the "Forgot Password" link
    Then the user should be redirected to the password reset page

  Scenario 2: User successfully requests a password reset link
    Given the user is on the password reset page
    And the user provides a registered email address
    When the user clicks on the "Send Reset Link" button
    Then the user should see a confirmation message stating "A password reset link has been sent to your email address"

  Scenario 3: User provides an unregistered email address for password reset
    Given the user is on the password reset page
    And the user provides an unregistered email address
    When the user clicks on the "Send Reset Link" button
    Then the user should see an error message stating "Email address not found"

  Scenario 4: User receives and uses the password reset link
    Given the user has received the password reset email
    When the user clicks on the password reset link in the email
    Then the user should be redirected to the password reset form

  Scenario 5: User successfully resets the password
    Given the user is on the password reset form
    And the user provides a new password
    And the user confirms the new password
    When the user clicks on the "Reset Password" button
    Then the user should see a confirmation message stating "Your password has been successfully reset"
    And the user should be redirected to the login page

  Scenario 6: User provides mismatched passwords on the password reset form
    Given the user is on the password reset form
    And the user provides a new password
    And the user provides a different password in the confirm password field
    When the user clicks on the "Reset Password" button
    Then the user should see an error message stating "Passwords do not match"

  Scenario 7: User provides a weak password on the password reset form
    Given the user is on the password reset form
    And the user provides a new password that does not meet the security criteria
    And the user confirms the weak password
    When the user clicks on the "Reset Password" button
    Then the user should see an error message stating "Password is too weak"