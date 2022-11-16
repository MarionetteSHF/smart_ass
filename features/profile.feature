Feature: Profile

I want to show my profile and update my information on SmartAss

Background: users in database

    Given the following users exist:
    | name           | email                   | phone         | password      |
    | hanfushi       | wangdazhuang@gmail.com  | 6462345569    | 25-Nov-1992   |
    | abc            | abc@gmail.com           | 12345678      | abcsecret     |
    And I go to the login page
    
Scenario: Show profile successfully
    When I fill in "Email address" with "abc@gmail.com"
    And I fill in "Password" with "abcsecret"
    And I press "Login"
    And I should be on the items page
    And I go to the profile page for "hanfushi"

Scenario: Go back to item page
    When I go to the profile page for "hanfushi"
    Then I follow "Back to item page"
    Then I should be on the items page

Scenario: Error on empty fields when I update the profile
    When I already logged in as user "1"
    And I go to the profile page for "hanfushi"
    Then I follow "Edit"
    Then I fill in "Name" with ""
    And I press "Save Changes"
    Then I should see "Please fill in all fields below."

Scenario: Update information on profile successfully
    When I already logged in as user "2"
    And I go to the profile page for "abc"
    And I follow "Edit"
    And I fill in "Name" with "new_test_name"
    And I fill in "Phone" with "87654321"
    And I press "Save Changes"
    Then I should see "new_test_name was successfully updated."
    And I should be on the profile page for "new_test_name"