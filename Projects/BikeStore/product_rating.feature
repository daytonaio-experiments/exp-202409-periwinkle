# Feature: Product Rating and Commenting

  Scenario 1: User rates a product they have purchased
    Given the user has purchased a product
    When the user decides to rate the product
    Then the user should be able to select a rating from 1 to 5

  Scenario 2: User leaves a comment after rating a product
    Given the user has purchased a product
    And the user has given a rating to the product
    When the user decides to leave a comment
    Then the user should be able to enter a text comment
    And the comment should be linked to the product rating

  Scenario 3: User tries to rate a product they have not purchased
    Given the user has not purchased the product
    When the user attempts to rate the product
    Then the user should be informed that they cannot rate products they have not purchased

  Scenario 4: User tries to leave a comment without rating the product
    Given the user has purchased a product
    When the user tries to leave a comment without rating the product
    Then the user should be informed that they need to rate the product before leaving a comment

  Scenario 5: User views their previous ratings and comments
    Given the user has rated and commented on products
    When the user navigates to their rating and comment history
    Then the user should see a list of products they have rated
    And each product should display the rating and comment left by the user

  Scenario 6: User tries to change their rating and comment for a product
    Given the user has rated and commented on a product
    When the user decides to update their rating and comment
    Then the user should be informed that they cannot change the rating and comment after saving it