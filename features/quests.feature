Feature: Quests Management
    As a user
    I want to manage my quests
    So that I can track my progress and achievements

    Background:
        Given I am on the quests page


    Scenario: View quests page
        Then I should see my profile image
        And I should see my name "Titinan Jaemduag"
        And I should see my academy name "Farmhouse Academy"
        And I should see brag button
        And I should see input fields for quest
        And I should see a button to add a new quest

    Scenario: Add a new quest
        When I fill in the quest input field with "Learn Ruby on Rails"
        And I click the "Add Quest" button
        Then I should see the quest "Learn Ruby on Rails" in the list of quests

    Scenario: Checkbox for quest completion
        Given there is a quest "Learn Ruby on Rails" in the list
        When I check the checkbox for the quest "Learn Ruby on Rails"
        Then the checkbox for the quest "Learn Ruby on Rails" should be checked

    Scenario: Delete a quest
        Given there is a quest "Learn Ruby on Rails" in the list
        When I click the delete button for the quest "Learn Ruby on Rails"
        Then I should not see the quest "Learn Ruby on Rails" in the list of quests

    Scenario: View Brag Document and back to quests page
        When I click the brag button
        Then I should be redirected to the brag document page
        And I should see my brag document title "PaRNtITi's Brag Document"
        And I should see my profile image on the brag document page
        And I should see content "2025"
        And I should see content "การเรียนรู้และพัฒนาตนเอง"
        And I should see content "พัฒนาทักษะ Web Development"
        And I should see content "การดูแลสุขภาพ"
        When I click the back button on the brag document page
        Then I should be redirected back to the quests page
        And I should see my profile image
        And I should see my name "Titinan Jaemduag"
        And I should see my academy name "Farmhouse Academy"