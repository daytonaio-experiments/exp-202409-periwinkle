# Feature: Multiple Payment Options for Gift Purchases

Scenario 1: Buying a gift using a debit card
  Given the user has selected a gift to purchase
  And the user is on the payment page
  When the user chooses to pay with a debit card
  And the user enters valid debit card details
  Then the payment should be successfully processed
  And the user should receive a confirmation of the purchase

Scenario 2: Buying a gift using PayPal
  Given the user has selected a gift to purchase
  And the user is on the payment page
  When the user chooses to pay with PayPal
  And the user logs into their PayPal account
  And the user confirms the payment
  Then the payment should be successfully processed
  And the user should receive a confirmation of the purchase

Scenario 3: Buying a gift using PayPal (replacing gift card)
  Given the user has selected a gift to purchase
  And the user is on the payment page
  When the user chooses to pay with PayPal
  And the user logs into their PayPal account
  And the user confirms the payment
  Then the payment should be successfully processed
  And the user should receive a confirmation of the purchase

Scenario 4: Buying a gift using a credit card
  Given the user has selected a gift to purchase
  And the user is on the payment page
  When the user chooses to pay with a credit card
  And the user enters valid credit card details
  Then the payment should be successfully processed
  And the user should receive a confirmation of the purchase