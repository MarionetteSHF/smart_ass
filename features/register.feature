Feature: Registration

Background:
    Given I go to the users page

Scenario: Error on empty fields
    When I press "Register"
    Then "Name" field should have the error
    And "Email address" field should have the error
    And "Phone Number" field should have the error
    And "Password" field should have the error
    And I should see "please fill in the following information"

Scenario: Register successfully
    When I fill in "Name" with "abc"
    And I fill in "Email address" with "abc@gmail.com"
    And I fill in "Phone Number" with "12345678"
    And I fill in "Password" with "abcabcsecret"
    Then I press "Register"
    And I go to the items page