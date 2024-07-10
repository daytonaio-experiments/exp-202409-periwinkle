# Feature

### Feature: Order Tracking
* 
* #### Scenario 1: User views order status and predicted delivery date
* 1. **Scenario**: User wants to view the current status of their order and the predicted date of delivery
*    - **Given** the user is on the order tracking page
*    - **When** the user enters their order ID
*    - **And** clicks the "Track Order" button
*    - **Then** the system displays the current status of the order
*    - **And** the system displays the predicted date of delivery
* 
* #### Scenario 2: User enters invalid order ID
* 2. **Scenario**: User enters an invalid order ID
*    - **Given** the user is on the order tracking page
*    - **When** the user enters an invalid order ID
*    - **And** clicks the "Track Order" button
*    - **Then** the system displays an error message indicating the order ID is invalid