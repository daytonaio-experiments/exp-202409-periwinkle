# Feature: Box Jumping

Scenario 1: User jumps on a box that is directly in front of them
  Given the user is standing
  And there is a box directly in front of the user
  When the user attempts to jump
  Then the user should land on top of the box

Scenario 2: User attempts to jump with no box in front
  Given the user is standing
  And there is no box directly in front of the user
  When the user attempts to jump
  Then the user should not land on any box

Scenario 3: User jumps on a box that is slightly off to the side
  Given the user is standing
  And there is a box slightly off to the side in front of the user
  When the user attempts to jump
  Then the user should land on top of the box

Scenario 4: User jumps on a box that is too far away
  Given the user is standing
  And there is a box too far away in front of the user
  When the user attempts to jump
  Then the user should not reach the box
  And the user should land on the ground

Scenario 5: User jumps on a box that is at an elevated position
  Given the user is standing
  And there is a box at an elevated position directly in front of the user
  When the user attempts to jump
  Then the user should land on top of the elevated box