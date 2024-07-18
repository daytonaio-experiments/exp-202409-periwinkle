# Feature: Profile Photo Update

Scenario 1: User successfully changes profile photo
  Given the user is logged into their account
  And the user is on the profile settings page
  When the user clicks on the "Change Profile Photo" button
  And the user selects a photo from their gallery
  And the user confirms the selection
  Then the profile photo should be updated to the selected photo
  And a success message should be displayed

Scenario 2: User cancels the profile photo change
  Given the user is logged into their account
  And the user is on the profile settings page
  When the user clicks on the "Change Profile Photo" button
  And the user selects a photo from their gallery
  But the user cancels the selection
  Then the profile photo should remain unchanged
  And no changes should be saved

Scenario 3: User tries to change profile photo without selecting a photo
  Given the user is logged into their account
  And the user is on the profile settings page
  When the user clicks on the "Change Profile Photo" button
  And the user does not select any photo
  And the user attempts to confirm the selection
  Then an error message should be displayed indicating that no photo was selected
  And the profile photo should remain unchanged

Scenario 4: User encounters an error while uploading the photo
  Given the user is logged into their account
  And the user is on the profile settings page
  When the user clicks on the "Change Profile Photo" button
  And the user selects a photo from their gallery
  And the upload process fails due to a network error
  Then an error message should be displayed indicating the upload failure
  And the profile photo should remain unchanged