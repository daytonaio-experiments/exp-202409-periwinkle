# Feature: Newsletter Subscription Button

Scenario 1: Displaying the subscribe button on the homepage
  Given I am on the homepage
  When the page loads
  Then I should see a "Subscribe to Newsletter" button

Scenario 2: Clicking the subscribe button
  Given I am on the homepage
  And I see the "Subscribe to Newsletter" button
  When I click the "Subscribe to Newsletter" button
  Then I should be redirected to the subscription form page

Scenario 3: Submitting the subscription form with valid email
  Given I am on the subscription form page
  And I have entered a valid email address in the email field
  When I click the "Submit" button
  Then I should see a confirmation message saying "You have successfully subscribed to the newsletter"

Scenario 4: Attempting to submit the subscription form with an invalid email
  Given I am on the subscription form page
  And I have entered an invalid email address in the email field
  When I click the "Submit" button
  Then I should see an error message saying "Please enter a valid email address"

Scenario 5: Submitting the subscription form with an already registered email
  Given I am on the subscription form page
  And I have entered an email address that is already registered in the email field
  When I click the "Submit" button
  Then I should see an error message saying "This email is already subscribed to the newsletter"

Scenario 6: Confirming the subscription in the email
  Given I have successfully submitted the subscription form with a valid email
  When I check my email inbox
  Then I should see a confirmation email
  And the email should contain a link to confirm my subscription

Scenario 7: Clicking the confirmation link in the email
  Given I have received a confirmation email
  When I click on the confirmation link in the email
  Then I should see a message on the website saying "Your subscription has been confirmed"

Scenario 8: Receiving newsletters after confirming the subscription
  Given my subscription has been confirmed
  When a new newsletter is released
  Then I should receive the newsletter in my email inbox with the latest news and offers