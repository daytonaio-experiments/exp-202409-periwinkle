# Feature: User selects a time and date for a doctor visit

  Scenario 1: User selects a valid date and time
    Given the user is on the appointment booking page
    When the user selects a valid date from the calendar
    And the user selects a valid time from the available slots
    Then the selected date and time should be saved for the appointment
    And a confirmation message should be displayed

  Scenario 2: User tries to select a past date
    Given the user is on the appointment booking page
    When the user selects a date that is in the past
    Then an error message should be displayed
    And the user should be prompted to select a future date

  Scenario 3: User tries to select a time outside of clinic hours
    Given the user is on the appointment booking page
    When the user selects a date within clinic hours
    And the user selects a time outside of the clinic's operating hours
    Then an error message should be displayed
    And the user should be prompted to select a time within clinic hours

  Scenario 4: User attempts to book an appointment without selecting a date and time
    Given the user is on the appointment booking page
    When the user attempts to book an appointment without selecting a date and time
    Then an error message should be displayed
    And the user should be prompted to select both a date and a time

  Scenario 5: User views available time slots for a selected date
    Given the user is on the appointment booking page
    When the user selects a valid date from the calendar
    Then the available time slots for that date should be displayed

  Scenario 6: User changes the selected date and time before booking
    Given the user is on the appointment booking page
    And the user has selected a date and time for the appointment
    When the user changes the selected date
    And the user selects a new time for the new date
    Then the updated date and time should be saved for the appointment
    And a confirmation message should be displayed

  Scenario 7: User selects a date but no available time slots
    Given the user is on the appointment booking page
    When the user selects a date that has no available time slots
    Then a message should be displayed indicating no available slots
    And the user should be prompted to select a different date


All scenarios have been kept as per your instructions and each scenario has been numbered accordingly.