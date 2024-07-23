# Feature: Add item to the list of favorites

Scenario 1: Add an item to the favorites list successfully
  Given I am a logged-in user
  And I am viewing an item that can be added to the favorites list
  When I click the "Add to Favorites" button
  Then the item should be added to my favorites list
  And I should see a confirmation message "Item added to favorites"

Scenario 2: Add an item to the favorites list without being logged in
  Given I am not a logged-in user
  And I am viewing an item that can be added to the favorites list
  When I click the "Add to Favorites" button
  Then I should be prompted to log in
  And the item should not be added to the favorites list

Scenario 3: Add an item that is already in the favorites list
  Given I am a logged-in user
  And I have already added the item to my favorites list
  When I click the "Add to Favorites" button
  Then I should see a message "Item is already in your favorites list"
  And the item should not be added again to the favorites list

Scenario 4: Add an item to the favorites list and view the updated list
  Given I am a logged-in user
  And I am viewing an item that can be added to the favorites list
  When I click the "Add to Favorites" button
  Then the item should be added to my favorites list
  And I should see the item listed in my favorites list

Scenario 5: Add an item to the favorites list when there is a network error
  Given I am a logged-in user
  And I am viewing an item that can be added to the favorites list
  And there is a network error
  When I click the "Add to Favorites" button
  Then I should see an error message "Unable to add item to favorites. Please try again later."
  And the item should not be added to the favorites list