Feature: Let's talk in short sentences
  In order to broadcast my every thought
  As an egomaniac
  I want to constantly update my status message

  Scenario: tweet
    Given there is a user named "bob"
    And that user has "login" set to "bob"
    When I log in as "bob"
    Then I should see "What's happening?"
    When I fill in "What's happening?" with "I seem to have set my hands on fire. Well, chemically. Well, by cutting peppers without wearing gloves. Look, what matters is OMG IT BURNS."
    And I press "update"
    Then I should see "I seem to have set my hands on fire. Well, chemically. Well, by cutting peppers without wearing gloves. Look, what matters is OMG IT BURNS."
    And I should see "What's happening?"
