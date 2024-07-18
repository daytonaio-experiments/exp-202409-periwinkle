### Feature: Change Password

#### Scenario 1: Successfully Change Password
**Given** the user is logged in  
**When** the user navigates to the change password page  
**And** the user enters the current password correctly  
**And** the user enters a new valid password  
**And** the user confirms the new password correctly  
**Then** the password should be updated successfully  
**And** the user should see a confirmation message