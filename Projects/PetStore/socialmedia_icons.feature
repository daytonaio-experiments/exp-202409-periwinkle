# Feature: Display social media icons in the footer

  Scenario 1: Display social media icons in the footer
    Given I am on any page of the store
    When I scroll to the footer
    Then I should see the social media icons

  Scenario 2: Click on the Facebook icon
    Given I am on any page of the store
    And I scroll to the footer
    When I click on the Facebook icon
    Then I should be redirected to the store's Facebook page

  Scenario 3: Click on the Twitter icon
    Given I am on any page of the store
    And I scroll to the footer
    When I click on the Twitter icon
    Then I should be redirected to the store's Twitter page

  Scenario 4: Click on the Instagram icon
    Given I am on any page of the store
    And I scroll to the footer
    When I click on the Instagram icon
    Then I should be redirected to the store's Instagram page

  Scenario 5: Click on the LinkedIn icon
    Given I am on any page of the store
    And I scroll to the footer
    When I click on the LinkedIn icon
    Then I should be redirected to the store's LinkedIn page

  Scenario 6: Visibility of social media icons on different devices
    Given I am using a desktop, tablet, or mobile device
    When I scroll to the footer on any device
    Then I should see the social media icons displayed correctly


Each scenario clearly outlines the steps needed to validate the presence and functionality of the social media icons in the footer of the page.