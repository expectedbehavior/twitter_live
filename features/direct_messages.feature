Feature: Sending short emails to people
  In order to send tiny emails to people
  As a person who sends tiny emails
  I want to tweet a private email to people

  Scenario: Private thought from Bruce to Chuck
    Given there is a user named "Chuck"
    And that user has "login" set to "Chuck"
    And there is a user named "Bruce"
    And that user has "login" set to "Bruce"
    When I log in as "Bruce"
    And I click "Direct Messages"
    And I select "Chuck" from "users"
    And I fill in "Direct Message" with "Just kidding about that hashing thing. We both know it'd cause a _collision_"
    And I press "Send"
    Then I should see "Direct message sent"
    When I click "logout"
    And I log in as "Chuck"
    And I click "Direct Messages"
    Then I should see "Just kidding about that hashing thing. We both know it'd cause a _collision_"
