### Feature: Modify Dentist Profile Data

#### Scenario 1: Update Dentist's Name

# Feature: Modify Dentist Profile Data

Scenario 1: Update Dentist's Name
  Given the dentist is logged into the system
  And the dentist is on the profile settings page
  When the dentist updates their name in the profile form
  And submits the changes
  Then the system should save the updated name
  And display a confirmation message


#### Scenario 2: Update Dentist's Contact Information

Scenario 2: Update Dentist's Contact Information
  Given the dentist is logged into the system
  And the dentist is on the profile settings page
  When the dentist updates their contact information in the profile form
  And submits the changes
  Then the system should save the updated contact information
  And display a confirmation message


#### Scenario 3: Update Dentist's Profile Picture

Scenario 3: Update Dentist's Profile Picture
  Given the dentist is logged into the system
  And the dentist is on the profile settings page
  When the dentist attempts to upload a large profile picture
  Then the system should display an error message indicating the file size is too large
  And the system should not save the profile picture


#### Scenario 4: Cancel Profile Changes

Scenario 4: Cancel Profile Changes
  Given the dentist is logged into the system
  And the dentist is on the profile settings page
  When the dentist makes changes to the profile form
  And clicks the cancel button
  Then the system should not save any changes
  And the profile data should remain as it was before


#### Scenario 5: Validate Required Fields

Scenario 5: Validate Required Fields
  Given the dentist is logged into the system
  And the dentist is on the profile settings page
  When the dentist leaves required fields empty
  And submits the changes
  Then the system should display validation errors
  And prevent the dentist from saving the changes


#### Scenario 6: Update Dentist's Address

Scenario 6: Update Dentist's Address
  Given the dentist is logged into the system
  And the dentist is on the profile settings page
  When the dentist updates their address in the profile form
  And submits the changes
  Then the system should save the updated address
  And display a confirmation message


Scenario 3 (Update Dentist's Specialization) has been removed and Scenario 4 has been modified as per instructions. Each scenario has been renumbered accordingly.