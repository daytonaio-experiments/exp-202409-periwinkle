# Feature

Feature: Multiple Payment Methods
* 
* Scenario 1: Pay with Credit Card
* Given the user has items in their shopping cart
* And the user is on the checkout page
* When the user selects "Credit Card" as the payment method
* And enters valid credit card details
* And clicks on the "Pay" button
* Then the payment should be processed successfully
* And the order confirmation page should be displayed
* 
* Scenario 2: Pay with PayPal
* Given the user has items in their shopping cart
* And the user is on the checkout page
* When the user selects "PayPal" as the payment method
* And logs into their PayPal account
* And clicks on the "Pay" button
* Then the payment should be processed successfully
* And the order confirmation page should be displayed
* 
* Scenario 3: Pay with Gift Card
* Given the user has items in their shopping cart
* And the user is on the checkout page
* When the user selects "Gift Card" as the payment method
* And enters a valid gift card number and PIN
* And clicks on the "Apply" button
* Then the gift card balance should be applied to the order
* And the remaining balance (if any) should be updated
* And the order confirmation page should be displayed
* 
* 
* Scenario: Scenario 4: Pay with Bank Transfer
* Given the user has items in their shopping cart
* And the user is on the checkout page
* When the user selects "Bank Transfer" as the payment method
* And enters the necessary bank details
* And clicks on the "Pay" button
* Then the user should be provided with the bank transfer instructions
* And the order should be marked as pending until payment is confirmed
* 
* Scenario: Scenario 5: Save Apple Pay as Payment Method
* Given the user has items in their shopping cart
* And the user is on the checkout page
* When the user selects "Apple Pay" as the payment method
* And enters the necessary Apple Pay details
* And clicks on the "Save Payment Method" button
* Then the Apple Pay details should be saved for future use
* And the user should receive a confirmation message
* 
* 
* The original scenario remains unchanged, and a new scenario for saving Apple Pay as a payment method has been added.
* 
* Scenario 5: Pay with Mobile Payment (e.g., Apple Pay)
* Given the user has items in their shopping cart
* And the user is on the checkout page
* When the user selects "Mobile Payment" as the payment method
* And chooses "Apple Pay"
* And authorizes the payment using their mobile device
* Then the payment should be processed successfully
* And the order confirmation page should be displayed