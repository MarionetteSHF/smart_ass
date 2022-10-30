Feature: Login
I want to login on SmartAss

Background:
    Given the following users exist:
    | name           | email                   | phone         | password      |
    | hanfushi       | wangdazhuang@gmail.com  | 6462345569    | 25-Nov-1992   |
    | abc            | abc@gmail.com           | 12345678      | abcsecret     |
    And I go to the login page
    
Scenario: Error on empty fields
    When I press "Login"
    Then I should see "invalid username or password"

Scenario: Wrong password
    When I fill in "Email address" with "abc@gmail.com"
    And I fill in "Password" with "wrongpassword"
    And I press "Login"
    Then I should see "invalid username or password"

Scenario: Login successfully
    When I fill in "Email address" with "wangdazhuang@gmail.com"
    And I fill in "Password" with "25-Nov-1992"
    And I press "Login"
    Then I go to the items page