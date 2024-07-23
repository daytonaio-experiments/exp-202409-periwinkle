# Feature: Reposting friends' posts
  As a user, I want to be able to repost my friends' posts so that I can share their content with my followers.

  Scenario 1: Reposting a friend's post from the feed
    Given I am logged into my account
    And I am viewing my feed
    And I see a post from a friend that I want to repost
    When I click on the repost button on that post
    Then the post should appear on my profile
    And the original author should be credited

  Scenario 2: Reposting a friend's post from their profile
    Given I am logged into my account
    And I am viewing a friend's profile
    And I see a post that I want to repost
    When I click on the repost button on that post
    Then the post should appear on my profile
    And the original author should be credited

  Scenario 3: Reposting a friend's post with a comment
    Given I am logged into my account
    And I am viewing my feed
    And I see a post from a friend that I want to repost
    When I click on the repost button on that post
    And I add a comment to the repost
    Then the post should appear on my profile with my comment
    And the original author should be credited

  Scenario 4: Reposting a friend's post that has been deleted
    Given I am logged into my account
    And I am viewing my feed
    And I see a post from a friend that I want to repost
    When I click on the repost button on that post
    And the post has been deleted by the original author
    Then I should see an error message indicating the post is no longer available

  Scenario 5: Reposting a friend's post when not logged in
    Given I am not logged into my account
    When I try to repost a friend's post
    Then I should be prompted to log in
    And the repost action should not be completed

  Scenario 6: Reposting a friend's post with privacy settings restricting reposts
    Given I am logged into my account
    And I am viewing my feed
    And I see a post from a friend that I want to repost
    When I click on the repost button on that post
    And the friend's privacy settings restrict reposts
    Then I should see a message indicating that reposting is not allowed for this post


These scenarios cover various aspects of the reposting functionality, including reposting from different views, handling errors, and respecting privacy settings.