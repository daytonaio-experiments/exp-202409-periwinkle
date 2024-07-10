# Feature

Sure, here are multiple BDD scenarios based on the provided user story:
* 
* ### Feature: Manage Account Profile
* 
* #### Scenario 1: Navigate to Account Profile
* 1. **Given** the user is logged into the application
*    **When** the user clicks on the profile icon
*    **Then** the user should be taken to their account profile page
* 
* #### Scenario 2: View List of Posts
* 2. **Given** the user is on their account profile page
*    **When** the user scrolls to the posts section
*    **Then** the user should see a list of all their posts
* 
* #### Scenario 3: Remove a Single Post
* 3. **Given** the user is on their account profile page
*    **And** the user can see a list of their posts
*    **When** the user clicks on the delete button next to a post they do not like
*    **Then** the post should be removed from their profile
* 
* #### Scenario 4: Confirm Post Deletion
* 4. **Given** the user is on their account profile page
*    **And** the user has clicked on the delete button next to a post
*    **When** a confirmation dialog appears
*    **And** the user confirms the deletion
*    **Then** the post should be permanently removed from their profile
* 
* #### Scenario 5: Cancel Post Deletion
* 5. **Given** the user is on their account profile page
*    **And** the user has clicked on the delete button next to a post
*    **When** a confirmation dialog appears
*    **And** the user cancels the deletion
*    **Then** the post should remain on their profile
* 
* #### Scenario 6: Remove Multiple Posts
* 6. **Given** the user is on their account profile page
*    **And** the user can see a list of their posts
*    **When** the user selects multiple posts they do not like
*    **And** the user clicks on the delete button
*    **Then** all selected posts should be removed from their profile
* 
* #### Scenario 7: Post Removal Confirmation for Multiple Posts
* 7. **Given** the user is on their account profile page
*    **And** the user has selected multiple posts to delete
*    **When** a confirmation dialog appears
*    **And** the user confirms the deletion
*    **Then** all selected posts should be permanently removed from their profile
* 
* #### Scenario 8: Cancel Multiple Post Deletion
* 8. **Given** the user is on their account profile page
*    **And** the user has selected multiple posts to delete
*    **When** a confirmation dialog appears
*    **And** the user cancels the deletion
*    **Then** all selected posts should remain on their profile
* 
* These scenarios cover navigating to the profile, viewing posts, and the processes of removing single or multiple posts, including confirmation steps.