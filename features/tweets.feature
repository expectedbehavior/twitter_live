Feature: Let's talk in short sentences
  In order to broadcast my everything
  As an egomaniac
  I want to constantly update my status message

  Scenario: tweet
    Given there is a user named "Wil Wheaton"
    And that user has "login" set to "wilw"
    When I log in as "wilw"
    Then I should see "What's happening?"
    When I fill in "What's happening?" with "I seem to have set my hands on fire."
    And I press "update"
    Then I should see "I seem to have set my hands on fire."
    And I should see "What's happening?"
