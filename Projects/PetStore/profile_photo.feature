# Feature: Profile Picture Update
  As a user, I want to be able to change my profile picture

  Scenario 1: Successful profile picture update
    Given the user is logged in
    And the user is on the profile page
    When the user selects a new picture from their device
    And the user clicks on the "Upload" button
    Then the profile picture should be updated
    And a success message "Profile picture updated successfully" should be displayed

  Scenario 2: Profile picture update with unsupported file format
    Given the user is logged in
    And the user is on the profile page
    When the user selects a file with an unsupported format
    And the user clicks on the "Upload" button
    Then the profile picture should not be updated
    And an error message "Unsupported file format" should be displayed

  Scenario 3: Profile picture update with a large file size
    Given the user is logged in
    And the user is on the profile page
    When the user selects a picture that exceeds the maximum allowed size
    And the user clicks on the "Upload" button
    Then the profile picture should not be updated
    And an error message "File size exceeds the maximum limit" should be displayed

  Scenario 4: Profile picture update with no file selected
    Given the user is logged in
    And the user is on the profile page
    When the user does not select any picture
    And the user clicks on the "Upload" button
    Then the profile picture should not be updated
    And an error message "No file selected" should be displayed

  Scenario 5: Profile picture update with network error
    Given the user is logged in
    And the user is on the profile page
    When the user selects a new picture from their device
    And the user clicks on the "Upload" button
    And a network error occurs
    Then the profile picture should not be updated
    And an error message "Network error. Please try again later" should be displayed


These scenarios cover a range of possible outcomes when a user attempts to change their profile picture, including successful updates, unsupported file formats, file size issues, no file selected, and network errors.