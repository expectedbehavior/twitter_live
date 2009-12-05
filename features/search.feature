Feature: Find Stuff
  In order to find people to stalk
  As a stalker
  I want to find everything

  Scenario: Find Bruce and follow him
    Given there is a user named "Chuck"
    And that user has "login" set to "Chuck"
    And there is a user named "Bruce"
    And that user has "login" set to "Bruce"
    When I log in as "Chuck"
    And I fill in "Find People" with "Bruce"
    And I press "find people"
    Then I should see "bruce"
    When I click "follow"
    Then I should see "You are now following bruce"
    
