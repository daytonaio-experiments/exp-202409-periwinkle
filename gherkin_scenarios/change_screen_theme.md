# Feature

Feature: Change screen theme
*   As a user
*   I want to be able to change the screen theme from light to dark
* 
* Scenario: Change screen theme from light to dark
*   Given I am on the home screen
*   When I tap on the settings button
*   And I navigate to the theme settings
*   And I select the dark theme option
*   Then the screen theme should change to dark
* 
* Scenario: Change screen theme from dark to light
*   Given I am on the home screen
*   When I tap on the settings button
*   And I navigate to the theme settings
*   And I select the light theme option
*   Then the screen theme should change to light