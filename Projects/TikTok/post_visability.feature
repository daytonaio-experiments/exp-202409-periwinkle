# Feature: Modify visibility of TikTok posted videos

Scenario 1: Change video visibility to public
  Given I am logged into my TikTok account
  And I have posted a video
  When I navigate to the video settings
  And I select the visibility option
  And I choose "Public"
  Then the video should be visible to everyone

Scenario 2: Change video visibility to friends only
  Given I am logged into my TikTok account
  And I have posted a video
  When I navigate to the video settings
  And I select the visibility option
  And I choose "Friends"
  Then the video should be visible only to my friends

Scenario 3: Verify current visibility setting of a video
  Given I am logged into my TikTok account
  And I have posted a video
  When I navigate to the video settings
  Then I should see the current visibility setting of the video

Scenario 4: Attempt to change visibility without selecting an option
  Given I am logged into my TikTok account
  And I have posted a video
  When I navigate to the video settings
  And I do not select any visibility option
  Then the visibility setting should remain unchanged
  And I should see a message prompting me to select a visibility option