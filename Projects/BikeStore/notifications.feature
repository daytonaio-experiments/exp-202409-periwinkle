**Feature: Notification about Special Offers**

**Scenario 1: User Opts-in for Notifications**
1. **Given** the user is logged into their account
   **And** the user is on the notification settings page
   **When** the user opts-in to receive notifications about special offers
   **Then** the system should save the user's preference
   **And** the user should see a confirmation message that they have successfully opted-in

**Scenario 2: User Receives Notification for Special Offers**
2. **Given** the user has opted-in to receive notifications about special offers
   **When** a new special offer is available
   **Then** the user should receive a notification about the special offer

**Scenario 3: User Opts-out of Notifications**
3. **Given** the user is logged into their account
   **And** the user is on the notification settings page
   **When** the user opts-out of receiving notifications about special offers
   **Then** the system should save the user's preference
   **And** the user should see a confirmation message that they have successfully opted-out

**Scenario 4: User Does Not Receive Notification After Opting-out**
4. **Given** the user has opted-out of receiving notifications about special offers
   **When** a new special offer is available
   **Then** the user should not receive a notification about the special offer

**Scenario 5: User Changes Notification Preferences**
5. **Given** the user is logged into their account
   **And** the user has initially opted-out of receiving notifications about special offers
   **When** the user changes their preference to opt-in for notifications about special offers
   **Then** the system should update the user's preference
   **And** the user should receive a confirmation message that they have successfully opted-in