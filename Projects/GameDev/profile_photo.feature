# Feature: Change Profile Picture

Scenario 1: Successfully change profile picture with a photo from the gallery
  Given I am logged in to my account
  And I am on the profile settings page
  When I click on the "Change Profile Picture" button
  And I select a photo from my gallery
  And I confirm the selection
  Then my profile picture should be updated with the selected photo
  And I should see a success message

Scenario 2: Cancel changing profile picture after selecting a photo
  Given I am logged in to my account
  And I am on the profile settings page
  When I click on the "Change Profile Picture" button
  And I select a photo from my gallery
  But I cancel the selection
  Then my profile picture should remain unchanged
  And I should not see any error or success message

Scenario 3: Attempt to change profile picture without selecting a photo
  Given I am logged in to my account
  And I am on the profile settings page
  When I click on the "Change Profile Picture" button
  And I do not select a photo from my gallery
  But I try to confirm the selection
  Then I should see an error message indicating that no photo was selected
  And my profile picture should remain unchanged

Scenario 4: Successfully change profile picture with a large photo from the gallery
  Given I am logged in to my account
  And I am on the profile settings page
  When I click on the "Change Profile Picture" button
  And I select a large photo from my gallery
  And I confirm the selection
  Then my profile picture should be updated with the selected large photo
  And I should see a success message