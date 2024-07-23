# Feature: Display doctor contact details in the footer

  Scenario 1: User sees doctor's contact details in the footer on the homepage
    Given the user is on the homepage
    When the page loads completely
    Then the footer should display the doctor's contact details
      And the contact details should include the doctor's name, phone number, and email address

  Scenario 2: User sees doctor's contact details in the footer on the about us page
    Given the user is on the about us page
    When the page loads completely
    Then the footer should display the doctor's contact details
      And the contact details should include the doctor's name, phone number, and email address

  Scenario 3: User sees doctor's contact details in the footer on the services page
    Given the user is on the services page
    When the page loads completely
    Then the footer should display the doctor's contact details
      And the contact details should include the doctor's name, phone number, and email address

  Scenario 4: User sees doctor's contact details in the footer on the contact us page
    Given the user is on the contact us page
    When the page loads completely
    Then the footer should display the doctor's contact details
      And the contact details should include the doctor's name, phone number, and email address

  Scenario 5: User does not see placeholder text for doctor's contact details
    Given the user is on any page of the website
    When the footer loads
    Then the footer should display the actual doctor's contact details
      And the details should not contain placeholder text like "Doctor Name" or "Email Address"