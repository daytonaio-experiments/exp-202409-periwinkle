# Feature: Change Background Color

Scenario 1: Default background color is light
  Given the user is on the homepage
  When the user has not made any changes to the background color
  Then the background color should be light

Scenario 2: User changes background color from light to dark
  Given the user is on the homepage
  And the background color is light
  When the user selects the option to change the background color to dark
  Then the background color should change to dark

Scenario 3: User changes background color from dark to light
  Given the user is on the homepage
  And the background color is dark
  When the user selects the option to change the background color to light
  Then the background color should change to light

Scenario 4: Background color change persists after page reload
  Given the user is on the homepage
  And the background color is dark
  When the user reloads the page
  Then the background color should remain dark

Scenario 5: Background color change persists after user logs out and logs back in
  Given the user is on the homepage
  And the background color is dark
  When the user logs out
  And the user logs back in
  Then the background color should remain dark