**Feature: Multiple Payment Options**

**Scenario 1: User selects to pay with a credit card**
1. **Given** the user is on the checkout page,
   **When** the user selects the "Credit Card" payment option,
   **Then** the system should display fields to enter credit card details.

**Scenario 2: User successfully pays with a credit card**
2. **Given** the user has selected the "Credit Card" payment option,
   **And** the user has entered valid credit card details,
   **When** the user clicks the "Pay Now" button,
   **Then** the payment should be processed successfully,
   **And** the user should see a confirmation message.

**Scenario 3: User selects to pay with PayPal**
3. **Given** the user is on the checkout page,
   **When** the user selects the "PayPal" payment option,
   **Then** the system should redirect the user to the PayPal login page.

**Scenario 4: User successfully pays with PayPal**
4. **Given** the user has selected the "PayPal" payment option,
   **And** the user has logged into their PayPal account,
   **When** the user confirms the payment,
   **Then** the payment should be processed successfully,
   **And** the user should be redirected back to the confirmation page on the website.

**Scenario 5: User selects to pay with a bank transfer**
5. **Given** the user is on the checkout page,
   **When** the user selects the "Bank Transfer" payment option,
   **Then** the system should display the bank account details for the transfer.

**Scenario 6: User successfully pays with a bank transfer**
6. **Given** the user has selected the "Bank Transfer" payment option,
   **And** the user has initiated the transfer from their bank,
   **When** the bank confirms the transfer,
   **Then** the system should update the order status to "Payment Received",
   **And** the user should receive a confirmation email.

These scenarios now cover various payment options excluding the gift card option, and each scenario is appropriately numbered.