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
  | title        | category     | number  | price | user_id |
  | imac         | Electronics  | 1       | 999   | 1       |
  | ipad         |              | 1       | 1099  | 2       |
  | bed frame    | Home & Tools | 1       | 100   | 1       |
  | Monitor      | Electronics  | 1       | 150   | 1       |
  | Basketball   | Sports       | 1       | 20    | 1       |

Scenario: add category but not logging in
  When I already logged in as user "1"
  Then I go to the items page
  And I go to the edit page for "ipad"
  And I should see "You are not authorized to edit this item"

Scenario: add category to existing item
  When I already logged in as user "1"
  And I go to the details page for "imac"
  And I follow "Edit"
  Then I should be on the edit page for "imac"
  And I select "Others" from "Category"
  And I press "Save Changes"
  Then the category of "imac" should be "Others"

Scenario: search category to 
  When I already logged in as user "1"
  Then I go to the details page for "Monitor"
  And  I follow "Show Category"
  And  I should see "imac"
  And  I should not see "Basketball"

Scenario: cannot find same category if it is empty
  When I already logged in as user "2"
  And I go to the details page for "ipad"
  Then I should not see "Show Category"