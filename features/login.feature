Feature: Login/Logout
I want to login or logout on SmartAss

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
    When I fill in "Email Address" with "abc@gmail.com"
    And I fill in "Password" with "wrongpassword"
    And I press "Login"
    Then I should see "invalid username or password"

Scenario: Login successfully
    When I fill in "Email Address" with "wangdazhuang@gmail.com"
    And I fill in "Password" with "25-Nov-1992"
    And I press "Login"
    Then I go to the items page

Scenario: Logout successfully
    When I fill in "Email Address" with "wangdazhuang@gmail.com"
    And I fill in "Password" with "25-Nov-1992"
    And I press "Login"
    And I follow "Logout"
    Then I should be on the items page