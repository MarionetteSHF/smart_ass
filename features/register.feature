Feature: Registration

Background:
    Given I go to the users page

Scenario: Error on empty fields
    When I press "Register"
    Then I should see "please fill in all information"

Scenario: Error on missing fields
    When I fill in "Email address" with "test@gmail.com"
    And I fill in "Phone Number" with "12345"
    Then I press "Register"
    And I should see "please fill in all information"
    
Scenario: Register successfully
    When I fill in "Name" with "abc"
    And I fill in "Email address" with "abc@gmail.com"
    And I fill in "Phone Number" with "12345678"
    And I fill in "Password" with "abcabcsecret"
    Then I press "Register"
    And I go to the items page