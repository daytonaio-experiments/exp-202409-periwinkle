# Feature: Navigation via logo in the header

  Scenario 1: Logo is displayed in the header
    Given I am a user on any page of the website
    When I look at the header
    Then I should see the logo displayed

  Scenario 2: Clicking the logo redirects to the home page
    Given I am a user on any page of the website
    When I click on the logo in the header
    Then I should be redirected to the home page

  Scenario 3: Logo in the header is clickable
    Given I am a user on any page of the website
    When I hover over the logo in the header
    Then the logo should be clickable

  Scenario 4: Logo redirects to home page from a specific page
    Given I am a user on the "Contact Us" page
    When I click on the logo in the header
    Then I should be redirected to the home page

  Scenario 5: Logo redirects to home page and retains session
    Given I am a logged-in user on the "Profile" page
    When I click on the logo in the header
    Then I should be redirected to the home page
    And I should still be logged in


These scenarios cover the display, functionality, and usability of the logo in the header as described in the user story.