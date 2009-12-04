Feature: Let's talk in short sentences
  In order to broadcast my every thought
  As an egomaniac
  I want to constantly update my status message

  Scenario: tweet
    Given there is a user named "bob"
    And that user has "login" set to "bob"
    When I log in as "bob"
    Then I should see "What are you doing now?"
