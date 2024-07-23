# Feature: Change color theme on phone background

Scenario 1: User successfully changes the color theme from default to dark mode
  Given the user is on the phone settings page
  And the current color theme is set to default
  When the user selects the dark mode from the color theme options
  Then the phone background color theme should change to dark mode
  And a confirmation message should be displayed

Scenario 2: User successfully changes the color theme from dark mode to light mode
  Given the user is on the phone settings page
  And the current color theme is set to dark mode
  When the user selects the light mode from the color theme options
  Then the phone background color theme should change to light mode
  And a confirmation message should be displayed

Scenario 3: User attempts to change the color theme without selecting an option
  Given the user is on the phone settings page
  And the current color theme is set to default
  When the user does not select any color theme option
  Then the phone background color theme should remain default
  And no confirmation message should be displayed

Scenario 4: User cancels the color theme change
  Given the user is on the phone settings page
  And the current color theme is set to default
  When the user selects the dark mode from the color theme options
  But then cancels the action
  Then the phone background color theme should remain default
  And no confirmation message should be displayed

Scenario 5: System displays an error message when there is a failure in changing the color theme
  Given the user is on the phone settings page
  And the current color theme is set to default
  When the user selects the dark mode from the color theme options
  And there is a system error while applying the new theme
  Then the phone background color theme should remain default
  And an error message should be displayed


Each scenario is designed to cover a different aspect of changing the color theme on a phone background, providing a comprehensive set of tests for this feature.