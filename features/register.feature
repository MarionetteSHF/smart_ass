Feature: Registration

Background:
    Given the following users exist:
    | name           | email                   | phone         | password      |
    | testuser       | wangdazhuang@gmail.com  | 6462345569    | thisispw123   |
    | abc            | abc@gmail.com           | 12345678      | abcsecret     |
    And I go to the register page 

Scenario: Error on empty fields
    When I press "Sign up"
    Then I should see "Please fill in all information"

Scenario: Error on missing fields
    when I fill in the following:
        | Name           |                  |
        | Email Address  | test@gmail.com   |
        | Phone Number   | 12345            |
        | Password       |                  |
    And I press "Sign up"
    Then I should see "Please fill in all information"

Scenario: The email address has been used
    When I fill in "Name" with "anotheruser"
    When I fill in "Email Address" with "wangdazhuang@gmail.com"
    When I fill in "Phone Number" with "87654321"
    When I fill in "Password" with "abc"
    And I press "Sign up"
    Then I should see "The email has already been registered"
    And I go to the register page

Scenario: The phone number has been used
    When I fill in "Name" with "anotheruser"
    When I fill in "Email Address" with "newaddress@gmail.com"
    When I fill in "Phone Number" with "12345678"
    When I fill in "Password" with "abc"
    And I press "Sign up"
    Then I should see "The phone has been used"
    And I go to the register page 
    
Scenario: Sign up successfully
    When I fill in "Name" with "greatuser"
    And I fill in "Email Address" with "greatuser@gmail.com"
    And I fill in "Phone Number" with "83619572"
    And I fill in "Password" with "abcabcsecret"
    Then I press "Sign up"
    And I go to the items page