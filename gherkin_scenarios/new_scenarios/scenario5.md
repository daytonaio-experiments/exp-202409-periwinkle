# Feature

Certainly! Below are multiple BDD scenarios in Gherkin syntax based on the provided text:
* 
* **Feature: Add items to the cart**
* 
* **Scenario 1: Add a single item to an empty cart**
* 
* Given the cart is empty
* When I add an item to the cart
* Then the cart should have 1 item
* And the total price should be updated
* 
* 
* **Scenario 2: Add multiple items one by one to the cart**
* 
* Given the cart is empty
* When I add the first item to the cart
* And I add the second item to the cart
* And I add the third item to the cart
* Then the cart should have 3 items
* And the total price should be updated
* 
* 
* **Scenario 3: Add multiple items at once to the cart**
* 
* Given the cart is empty
* When I add 3 items to the cart at once
* Then the cart should have 3 items
* And the total price should be updated
* 
* 
* **Scenario 4: Add an item to a cart that already has items**
* 
* Given the cart has 2 items
* When I add another item to the cart
* Then the cart should have 3 items
* And the total price should be updated
* 
* 
* **Scenario 5: Add the same item multiple times to the cart**
* 
* Given the cart is empty
* When I add the same item 3 times to the cart
* Then the cart should have 3 items
* And the total price should be updated
* 
* 
* **Scenario 6: Verify cart updates when items are added**
* 
* Given the cart is empty
* When I add an item to the cart
* Then the cart icon should display 1 item
* And the cart summary should reflect 1 item
* And the total price should be updated
* 
* 
* **Scenario 7: Add items to the cart when the user is not logged in**
* 
* Given the user is not logged in
* And the cart is empty
* When I add an item to the cart
* Then the cart should have 1 item
* And the total price should be updated
* 
* 
* **Scenario 8: Add items to the cart when the user is logged in**
* 
* Given the user is logged in
* And the cart is empty
* When I add an item to the cart
* Then the cart should have 1 item
* And the total price should be updated
* And the item should be visible in the user's cart on the account page
* 
* 
* These scenarios cover various aspects of adding items to the cart, including different quantities and user states.