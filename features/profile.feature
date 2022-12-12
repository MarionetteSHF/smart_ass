Feature: Profile

I want to show my profile and update my information on SmartAss

Background: users in database

    Given the following users exist:
    | name           | email                   | phone         | password      |
    | hanfushi       | wangdazhuang@gmail.com  | 6462345569    | oldpwd        |
    | abc            | abc@gmail.com           | 12345678      | abcsecret     |
    And I go to the login page
    
Scenario: Show profile successfully
    When I already logged in as user "1"
    Then I should be on the items page
    And I go to the profile page for "hanfushi"

Scenario: Error on empty fields when I reset password 
    When I already logged in as user "1"
    And I go to the profile page for "hanfushi"
    And I follow "Reset"
    And I press "Save Changes"
    Then I should see "Password cannot be empty."

Scenario: old and new passwords are the same when I reset password 
    When I already logged in as user "1"
    And I go to the profile page for "hanfushi"
    And I follow "Reset"
    And I fill in "New Password" with "oldpwd"
    And I fill in "Confirm Your Password" with "oldpwd"
    And I press "Save Changes"
    Then I should see "The new password you entered is the same as your old password. Enter a different password."

Scenario: Passwords don't match when I reset password 
    When I already logged in as user "1"
    And I go to the profile page for "hanfushi"
    And I follow "Reset"
    And I fill in "New Password" with "secret1"
    And I fill in "Confirm Your Password" with "secret2"
    And I press "Save Changes"
    Then I should see "Password didn't match."

Scenario: Reset password successfully
    When I already logged in as user "1"
    And I go to the profile page for "hanfushi"
    And I follow "Reset"
    Then I fill in "New Password" with "newpwd"
    Then I fill in "Confirm Your Password" with "newpwd"
    And I press "Save Changes"
    Then I should see "Your password was successfully updated."
    And I should be on the profile page for "hanfushi"

Scenario: Error on empty fields when I update the profile
    When I already logged in as user "1"
    And I go to the profile page for "hanfushi"
    Then I follow "Edit"
    Then I fill in "Name" with ""
    And I press "Save Changes"
    Then I should see "Please fill in your name and contact below."

Scenario: Update information on profile successfully
    When I already logged in as user "2"
    And I go to the profile page for "abc"
    And I follow "Edit"
    And I fill in "Name" with "new_test_name"
    And I fill in "Phone" with "87654321"
    And I press "Save Changes"
    Then I should see "Your information was successfully updated."
    And I should be on the profile page for "new_test_name"