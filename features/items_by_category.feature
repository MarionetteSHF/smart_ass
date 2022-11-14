Feature: search for items by category

  As a web user
  So that I can find items using filter method
  I want to include and search on category information in items I enter

Background: items in database

  Given the following users registered:
  | phone      | name | email            | password |
  | 4123893748 | Wu   | wuw1998@sina.com | 123456   |
  | 4123893788 | Qi   | qi1998@sina.com  | 123456   |

  Given the following items exist:
  | title        | category  | number  | neededItem | price | user_id |
  | imac         |           | 1       | false      | 500   | 1       |
  | ipad         |           | 1       | false      | 1000  | 2       |
  | bed frame    | furniture | 1       | true       | 100   | 1       |
  | BMW          | vehicle   | 1       | false      | 40000 | 1       |
  | Audi         | vehicle   | 1       | false      | 45000 | 1       |

Scenario: add category but not logging in
  When I already logged in as user "1"
  Then I go to the items page
  And I go to the edit page for "ipad"
  And I should see "You are not authorized to edit this item"

Scenario: add category to existing item
  When I go to the edit page for "ipad"
  And  I fill in "Category" with "IT"
  And  I press "Save Changes"
  Then the category of "ipad" should be "IT"

Scenario: search category to 
  When I go to the details page for "BMW"
  And  I follow "Show Category"
  And  I should see "Audi"
  And  I should not see "iphone"

Scenario: cannot find same category if it is empty
  Given I am on the details page for "imac"
  When I follow "Show Category"
  Then  I should be on the items page
  And I should see "'imac' has no category info"