# Feature: Add item to the cart

Scenario 1: Display Add to Cart button
  Given I am on the product page
  When I view the product details
  Then I should see an "Add to Cart" button

Scenario 2: Successfully add an item to the cart
  Given I am on the product page
  And I can see the "Add to Cart" button
  When I click on the "Add to Cart" button
  Then the item should be added to the cart
  And I should see a confirmation message

Scenario 3: Add item to the cart when not logged in
  Given I am on the product page
  And I am not logged in
  When I click on the "Add to Cart" button
  Then I should be prompted to log in or register

Scenario 4: Add item to the cart with insufficient stock
  Given I am on the product page
  And the item has insufficient stock
  When I click on the "Add to Cart" button
  Then I should see a message indicating the item is out of stock

Scenario 5: Add item to the cart with sufficient stock
  Given I am on the product page
  And the item has sufficient stock
  When I click on the "Add to Cart" button
  Then the item should be added to the cart
  And the stock quantity should be updated

Scenario 6: Add multiple items to the cart
  Given I am on the product page
  And I can see the "Add to Cart" button
  When I click on the "Add to Cart" button multiple times
  Then the item should be added to the cart each time
  And the cart should reflect the correct number of items

Scenario 7: Add item to the cart with variant selection
  Given I am on the product page
  And the product has multiple variants (e.g., color, size)
  When I select a variant
  And I click on the "Add to Cart" button
  Then the selected variant should be added to the cart

These scenarios cover various aspects of the functionality related to adding an item to the cart, ensuring that different conditions and user interactions are considered.