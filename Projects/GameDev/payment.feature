**Feature: Change Payment Method**

**Scenario 1: User adds a new card successfully**

* Given the user is logged into their account
* And the user is on the payment methods page
* When the user selects the option to add a new card
* And the user enters valid card details
* Then the new card should be added to the list of payment methods
* And the user should receive a confirmation message


**Scenario 2: User fails to add a new card due to invalid details**

* Given the user is logged into their account
* And the user is on the payment methods page
* When the user selects the option to add a new card
* And the user enters invalid card details
* Then the new card should not be added to the list of payment methods
* And the user should receive an error message indicating the issue


**Scenario 3: User removes an existing card successfully**

* Given the user is logged into their account
* And the user is on the payment methods page
* And the user has at least one card in the list of payment methods
* When the user selects the option to remove a card
* And the user confirms the removal
* Then the selected card should be removed from the list of payment methods
* And the user should receive a confirmation message


**Scenario 4: User attempts to remove a card but cancels the action**

* Given the user is logged into their account
* And the user is on the payment methods page
* And the user has at least one card in the list of payment methods
* When the user selects the option to remove a card
* And the user cancels the removal action
* Then the selected card should remain in the list of payment methods
* And the user should not receive a confirmation message


**Scenario 5: User views the list of payment methods**

* Given the user is logged into their account
* And the user is on the payment methods page
* When the user views the list of payment methods
* Then all the user's saved cards should be displayed


**Scenario 6: User encounters an error while accessing the payment methods page**

* Given the user is logged into their account
* When the user navigates to the payment methods page
* And there is a server error
* Then the user should receive an error message indicating the issue
* And the payment methods page should not be displayed


These scenarios cover adding and removing cards, viewing the list of payment methods, and handling potential errors.