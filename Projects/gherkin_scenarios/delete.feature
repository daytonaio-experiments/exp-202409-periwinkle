# Feature: User Account Deletion

  Scenario 1: Display delete account button
    Given I am logged into my account
    When I navigate to my account settings page
    Then I should see a button labeled "Delete Account"

  Scenario 2: Confirm account deletion
    Given I am on the account settings page
    And I can see the "Delete Account" button
    When I click on the "Delete Account" button
    Then I should see a confirmation dialog asking "Are you sure you want to delete your account?"

  Scenario 3: Successfully delete account after confirmation
    Given I am viewing the confirmation dialog for account deletion
    When I click the "Yes" button on the confirmation dialog
    Then my account should be deleted
    And I should be logged out
    And I should be redirected to the homepage
    And I should see a message saying "Your account has been successfully deleted."

  Scenario 4: Cancel account deletion
    Given I am viewing the confirmation dialog for account deletion
    When I click the "No" button on the confirmation dialog
    Then my account should not be deleted
    And I should remain on the account settings page

  Scenario 5: Prevent account deletion for unauthorized users
    Given I am not logged into my account
    When I try to access the account settings page
    Then I should be redirected to the login page
    And I should see a message saying "Please log in to access your account settings."

These scenarios cover the main actions and outcomes related to the user story about deleting an account profile.