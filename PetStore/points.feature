# Feature: Collecting points and redeeming them for discounts

  Scenario 1: User collects points by buying a product
    Given the user is logged into their account
    And the user has selected a product to purchase
    When the user completes the purchase
    Then the user's account should be credited with points corresponding to the product's value

  Scenario 2: User checks their points balance after a purchase
    Given the user is logged into their account
    And the user has completed a purchase
    When the user navigates to their points balance page
    Then the user should see an updated points balance reflecting the recent purchase

  Scenario 3: User redeems points for a discount
    Given the user is logged into their account
    And the user has accumulated a sufficient number of points
    When the user chooses to redeem points during the checkout process
    Then the user should receive a discount on their total purchase amount
    And the redeemed points should be deducted from their points balance

  Scenario 4: User attempts to redeem points without sufficient balance
    Given the user is logged into their account
    And the user has not accumulated enough points for a discount
    When the user tries to redeem points during the checkout process
    Then the system should notify the user that they do not have enough points for a discount
    And the user should not receive any discount on their purchase

  Scenario 5: User views points earning rules
    Given the user is logged into their account
    When the user navigates to the points program information page
    Then the user should see the rules and conditions for earning and redeeming points

  Scenario 6: User receives points for a promotional event
    Given the user is logged into their account
    And the store is running a promotional event that awards extra points for purchases
    When the user completes a purchase during the promotional period
    Then the user's account should be credited with the promotional points in addition to the regular points


These scenarios cover the process of collecting points, checking points balance, redeeming points for discounts, handling insufficient points, viewing points program rules, and receiving promotional points.