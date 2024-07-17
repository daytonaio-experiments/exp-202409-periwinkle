### Feature: Add Multiple Same Products to Cart

#### Scenario 1: Add a single product multiple times to the cart
1. **Scenario:** Add a single product multiple times to the cart
   - **Given** a customer is on the product page
   - **When** the customer clicks the "Add to Cart" button for the product
   - **And** the customer clicks the "Add to Cart" button for the same product again
   - **Then** the cart should display the product with a quantity of 2

#### Scenario 2: Add a product to the cart and then increase its quantity
2. **Scenario:** Add a product to the cart and then increase its quantity
   - **Given** a customer has added a product to the cart
   - **When** the customer navigates to the cart
   - **And** the customer increases the quantity of the product to 3
   - **Then** the cart should display the product with a quantity of 3

#### Scenario 3: Add the same product with different quantities at different times
3. **Scenario:** Add the same product with different quantities at different times
   - **Given** a customer is on the product page
   - **When** the customer adds 2 units of the product to the cart
   - **And** the customer adds 3 more units of the same product to the cart later
   - **Then** the cart should display the product with a total quantity of 5

#### Scenario 4: Verify total price updates with multiple quantities
4. **Scenario:** Verify total price updates with multiple quantities
   - **Given** a customer has added a product priced at $10 to the cart
   - **When** the customer increases the quantity of the product to 4
   - **Then** the cart should display the product with a total price of $40

#### Scenario 5: Add and remove multiple quantities of the same product
5. **Scenario:** Add and remove multiple quantities of the same product
   - **Given** a customer has added 5 units of a product to the cart
   - **When** the customer removes 2 units of the product from the cart
   - **Then** the cart should display the product with a quantity of 3

These scenarios cover various aspects of adding multiple same products to the cart, ensuring that the functionality meets the customer’s requirements.