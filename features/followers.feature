Feature: Follow my friends
  In order to not see what every yahoo is saying
  As a discerning egomaniac
  I want to filter the crap

  Scenario: follow
    Given there is a user named "Chuck"
    And that user has "login" set to "Chuck"
    And there is a user named "Bruce"
    And that user has "login" set to "Bruce"
    And there is a user named "Paris"
    And that user has "login" set to "Paris"
    When I log in as "Paris"
    And I fill in "What's happening?" with "I'm like totally skinny, and have no marketable skills"
    And I press "update"
    And I click "logout"
    And I log in as "Chuck"
    Then I should not see "I'm like totally skinny, and have no marketable skills"
    When I view the homepage of "Bruce"
    And I click "follow"
    Then I should see "You are now following Bruce"
    When I click "logout"
    And I log in as "Bruce"
    And I fill in "What's happening?" with "I'll hash your face"
    And I press "update"
    And I click "logout"
    And I log in as "Chuck"
    Then I should see "I'll hash your face"
