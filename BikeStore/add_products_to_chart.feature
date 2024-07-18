**Feature: Add multiple products to cart**

**Scenario 1: Add a single product to an empty cart**

Scenario 1: Adding a single product to an empty cart
  Given the cart is empty
  When I add a product to the cart
  Then the cart should contain 1 product
  And the product details should be displayed correctly


**Scenario 2: Add the same product multiple times**

Scenario 2: Adding the same product multiple times to the cart
  Given the cart is empty
  When I add product A to the cart
  And I add product A to the cart again
  Then the cart should contain 1 product with a quantity of 2
  And the product details should reflect the correct quantity


**Scenario 3: Add products when the cart already has items**

Scenario 3: Adding products to a cart that already has items
  Given the cart contains product A
  When I add product B to the cart
  Then the cart should contain 2 different products
  And the details for both products should be displayed correctly


**Scenario 4: Adding products when one product is out of stock**

Scenario 4: Adding products when one product is out of stock
  Given the cart is empty
  And product B is out of stock
  When I add product A to the cart
  And I attempt to add product B to the cart
  Then the cart should contain only product A
  And I should see a message that product B is out of stock


Each scenario is designed to cover various aspects and edge cases of adding multiple products to a cart, ensuring comprehensive testing of the feature.