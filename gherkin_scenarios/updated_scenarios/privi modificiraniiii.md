# Feature

Feature: Multiple Payment Methods for Orders
* 
* Scenario 1: Pay with Credit Card
*     Given a user has items in their cart
*     And the user proceeds to checkout
*     When the user selects "Credit Card" as the payment method
*     And enters valid credit card details
*     Then the payment should be processed successfully
*     And the order confirmation should be displayed
* 
* Scenario 2: Pay with PayPal
*     Given a user has items in their cart
*     And the user proceeds to checkout
*     When the user selects "PayPal" as the payment method
*     And logs into their PayPal account
*     Then the payment should be processed successfully
*     And the order confirmation should be displayed
* 
* Scenario 3: Pay with Bank Transfer
*     Given a user has items in their cart
*     And the user proceeds to checkout
*     When the user selects "Bank Transfer" as the payment method
*     And enters the necessary bank transfer details
*     Then the payment should be processed successfully
*     And the order confirmation should be displayed
* 
* Scenario 4: Payment Failure Due to Invalid Credit Card Details
*     Given a user has items in their cart
*     And the user proceeds to checkout
*     When the user selects "Credit Card" as the payment method
*     And enters invalid credit card details
*     Then the payment should fail
*     And an error message should be displayed indicating invalid payment details
* 
* Scenario 5: Payment Failure Due to Insufficient PayPal Balance
*     Given a user has items in their cart
*     And the user proceeds to checkout
*     When the user selects "PayPal" as the payment method
*     And logs into their PayPal account with insufficient balance
*     Then the payment should fail
*     And an error message should be displayed indicating insufficient funds
* 
* Scenario 6: Payment Failure Due to Expired Gift Card
*     Given a user has items in their cart
*     And the user proceeds to checkout
*     When the user selects "Gift Card" as the payment method
*     And enters an expired gift card code
*     Then the payment should fail
*     And an error message should be displayed indicating the gift card is expired
* 
* Scenario 7: Payment Failure Due to Incorrect Bank Transfer Details
*     Given a user has items in their cart
*     And the user proceeds to checkout
*     When the user selects "Bank Transfer" as the payment method
*     And enters incorrect bank transfer details
*     Then the payment should fail
*     And an error message should be displayed indicating incorrect bank transfer details
*     And the user should receive an email about incorrect bank transfer details