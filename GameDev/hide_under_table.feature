# Feature: Player hiding under the table

  Scenario 1: Player can hide under the table when positioned next to it
    Given the player is positioned next to the table
    When the player chooses to hide
    Then the player should be hidden under the table

  Scenario 2: Player cannot hide under the table when not positioned next to it
    Given the player is not positioned next to the table
    When the player chooses to hide
    Then the player should not be hidden under the table
    And the player should be notified that hiding is not possible

  Scenario 3: Player remains hidden under the table until they choose to unhide
    Given the player is hidden under the table
    When the player chooses to unhide
    Then the player should no longer be hidden under the table

  Scenario 4: Player cannot hide under the table if already hidden somewhere else
    Given the player is hidden inside a closet
    When the player attempts to hide under the table
    Then the player should remain hidden inside the closet
    And the player should be notified that they are already hiding

  Scenario 5: Player can hide under the table only if the table is not occupied
    Given the player is positioned next to the table
    And the table is not occupied
    When the player chooses to hide
    Then the player should be hidden under the table

  Scenario 6: Player cannot hide under the table if it is occupied
    Given the player is positioned next to the table
    And the table is occupied
    When the player chooses to hide
    Then the player should not be hidden under the table
    And the player should be notified that the table is occupied


All scenarios have been kept as per your instructions, and they have been numbered accordingly.