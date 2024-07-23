# Feature: Add multiple cars to user collection

Scenario 1: Successfully add a single car to the collection
    Given the user is logged into their account
    And the user is on the "My Collection" page
    When the user selects the option to add a new car
    And the user enters valid car details
    And the user clicks the "Add Car" button
    Then the car should be added to the user's collection
    And a confirmation message "Car added successfully" should be displayed

Scenario 2: Add multiple cars to the collection one by one
    Given the user is logged into their account
    And the user is on the "My Collection" page
    When the user selects the option to add a new car
    And the user enters valid car details
    And the user clicks the "Add Car" button
    Then the car should be added to the user's collection
    And a confirmation message "Car added successfully" should be displayed
    When the user selects the option to add another car
    And the user enters valid car details
    And the user clicks the "Add Car" button
    Then the second car should be added to the user's collection
    And a confirmation message "Car added successfully" should be displayed

Scenario 3: Attempt to add a car with invalid details
    Given the user is logged into their account
    And the user is on the "My Collection" page
    When the user selects the option to add a new car
    And the user enters invalid car details
    And the user clicks the "Add Car" button
    Then the car should not be added to the user's collection
    And an error message "Invalid car details" should be displayed

Scenario 4: View the collection after adding multiple cars
    Given the user is logged into their account
    And the user has added multiple cars to their collection
    When the user navigates to the "My Collection" page
    Then the user should see all the cars they have added in their collection

Scenario 5: Attempt to add a duplicate car to the collection
    Given the user is logged into their account
    And the user is on the "My Collection" page
    And the user has already added a car with specific details
    When the user selects the option to add a new car
    And the user enters the same car details
    And the user clicks the "Add Car" button
    Then the car should not be added to the user's collection
    And an error message "Car already exists in the collection" should be displayed