**Feature: User Login**

**Scenario 1: Successful login with valid credentials**

* Given the user is on the login page
* When the user enters a valid username
* And the user enters a valid password
* And the user clicks the login button
* Then the user should be redirected to the homepage
* And the user should see personalized content


**Scenario 2: Unsuccessful login with invalid password**

* Given the user is on the login page
* When the user enters a valid username
* And the user enters an invalid password
* And the user clicks the login button
* Then the user should see an error message "Invalid credentials"
* And the user should still be on the login page


**Scenario 3: Unsuccessful login with invalid username**

* Given the user is on the login page
* When the user enters an invalid username
* And the user enters a valid password
* And the user clicks the login button
* Then the user should see an error message "Invalid credentials"
* And the user should still be on the login page


**Scenario 4: Unsuccessful login with empty fields**

* Given the user is on the login page
* When the user leaves the username field empty
* And the user leaves the password field empty
* And the user clicks the login button
* Then the user should see an error message "Username and Password are required"
* And the user should still be on the login page


**Scenario 5: Unsuccessful login with empty username field**

* Given the user is on the login page
* When the user leaves the username field empty
* And the user enters a valid password
* And the user clicks the login button
* Then the user should see an error message "Username is required"
* And the user should still be on the login page


**Scenario 6: Unsuccessful login with empty password field**

* Given the user is on the login page
* When the user enters a valid username
* And the user leaves the password field empty
* And the user clicks the login button
* Then the user should see an error message "Password is required"
* And the user should still be on the login page


**Scenario 7: Remember me option during login**

* Given the user is on the login page
* When the user enters a valid username
* And the user enters a valid password
* And the user checks the "Remember me" option
* And the user clicks the login button
* Then the user should be redirected to the homepage
* And the user should see personalized content
* And the user should remain logged in after closing and reopening the browser


**Scenario 8: Forgot password link**

* Given the user is on the login page
* When the user clicks the "Forgot Password" link
* Then the user should be redirected to the password recovery page


These scenarios cover different aspects of the login functionality, ensuring a thorough testing process.