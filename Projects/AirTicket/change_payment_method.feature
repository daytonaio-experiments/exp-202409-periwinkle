**Feature: Change Payment Method**

**Scenario 1: Display available payment methods**

* Given the user is logged into their account
* When the user navigates to the payment settings page
* Then the system should display a list of available payment methods


**Scenario 2: Select a new payment method**

* Given the user is on the payment settings page
* And a list of available payment methods is displayed
* When the user selects a new payment method from the list
* Then the system should highlight the selected payment method


**Scenario 3: Confirm the change of payment method**

* Given the user has selected a new payment method
* When the user clicks on the 'Save' button
* Then the system should prompt the user to confirm the change


**Scenario 4: Successfully change the payment method**

* Given the user has confirmed the change of payment method
* When the system processes the change
* Then the system should display a success message
* And the new payment method should be set as the default


**Scenario 5: Handle payment method change failure**

* Given the user has confirmed the change of payment method
* When the system fails to process the change
* Then the system should display an error message
* And the previous payment method should remain as the default


**Scenario 6: Validate the new payment method**

* Given the user has selected a new payment method
* When the user tries to save the new payment method
* Then the system should validate the new payment method details
* And display an error message if the details are invalid


These scenarios now reflect the renumbered sequence after the removal of the original Scenario 6.