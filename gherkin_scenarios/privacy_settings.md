# Feature

Feature: Privacy Settings Management
*   In order to control who sees my personal information
*   As a user
*   I want to change my privacy settings
* 
* Scenario: User changes privacy settings
*   Given I am logged into my account
*   And I am on the privacy settings page
*   When I select the option to change privacy settings
*   And I choose who can see my personal information
*   Then my privacy settings should be updated
*   And my personal information should only be visible to the selected audience
*   But if I do not save the changes
*   Then my privacy settings should remain unchanged