# Feature: Display dentist contact details in the footer

  Scenario 1: User sees dentist contact details in the footer on the homepage
    Given the user is on the homepage
    When the page loads completely
    Then the user should see the dentist contact details in the footer

  Scenario 2: User sees dentist contact details in the footer on the about page
    Given the user is on the about page
    When the page loads completely
    Then the user should see the dentist contact details in the footer

  Scenario 3: User sees dentist contact details in the footer on the services page
    Given the user is on the services page
    When the page loads completely
    Then the user should see the dentist contact details in the footer

  Scenario 4: User sees dentist contact details in the footer on the contact page
    Given the user is on the contact page
    When the page loads completely
    Then the user should see the dentist contact details in the footer