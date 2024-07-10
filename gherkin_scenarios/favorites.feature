Certainly! Here are multiple BDD scenarios based on the provided requirement:

### Feature: Add Item to Favorites

#### Scenario 1: Display Add to Favorites Button
**Given** the user is viewing an item  
**When** the item detail page is loaded  
**Then** an "Add to Favorites" button should be visible

#### Scenario 2: Add Item to Favorites
**Given** the user is viewing an item  
**And** the item detail page is loaded  
**When** the user clicks the "Add to Favorites" button  
**Then** the item should be added to the user's list of favorites  
**And** a confirmation message should be displayed

#### Scenario 3: Add Item to Favorites When Not Logged In
**Given** the user is viewing an item  
**And** the item detail page is loaded  
**And** the user is not logged in  
**When** the user clicks the "Add to Favorites" button  
**Then** the user should be prompted to log in

#### Scenario 4: Add Item Already in Favorites
**Given** the user is viewing an item  
**And** the item is already in the user's list of favorites  
**When** the user clicks the "Add to Favorites" button  
**Then** the user should see a message indicating the item is already in the favorites list

#### Scenario 5: Add Item to Favorites for Logged-in User
**Given** the user is logged in  
**And** the user is viewing an item  
**When** the user clicks the "Add to Favorites" button  
**Then** the item should be added to the user's list of favorites  
**And** the "Add to Favorites" button should change to "Remove from Favorites"

#### Scenario 6: Remove Item from Favorites
**Given** the user is logged in  
**And** the user is viewing an item  
**And** the item is already in the user's list of favorites  
**When** the user clicks the "Remove from Favorites" button  
**Then** the item should be removed from the user's list of favorites  
**And** the "Remove from Favorites" button should change to "Add to Favorites"