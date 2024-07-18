# Feature: Buying clothing for avatar with collected points

  Scenario 1: Successful purchase of clothing item with sufficient points
    Given the user has collected 1000 points
    And the user is on the avatar clothing store page
    When the user selects a clothing item worth 500 points
    And the user confirms the purchase
    Then the clothing item is added to the user's avatar wardrobe
    And 500 points are deducted from the user's total points

  Scenario 2: Attempting to purchase clothing item with insufficient points
    Given the user has collected 200 points
    And the user is on the avatar clothing store page
    When the user selects a clothing item worth 500 points
    And the user attempts to confirm the purchase
    Then the system displays an error message "Insufficient points"
    And the clothing item is not added to the user's avatar wardrobe
    And no points are deducted from the user's total points

  Scenario 3: Viewing available points on the avatar clothing store page
    Given the user has collected 750 points
    When the user navigates to the avatar clothing store page
    Then the system displays "750 points available" on the store page

  Scenario 4: Viewing clothing item details before purchase
    Given the user is on the avatar clothing store page
    When the user selects a clothing item to view details
    Then the system displays the clothing item details including the points cost

  Scenario 5: Successful purchase updates points in real-time
    Given the user has collected 1000 points
    And the user is on the avatar clothing store page
    When the user purchases a clothing item worth 300 points
    Then the system immediately updates the displayed points to "700 points available"

  Scenario 6: Canceling a clothing item purchase
    Given the user has collected 900 points
    And the user is on the avatar clothing store page
    When the user selects a clothing item worth 400 points
    And the user cancels the purchase before confirming
    Then the clothing item is not added to the user's avatar wardrobe
    And no points are deducted from the user's total points