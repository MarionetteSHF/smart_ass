Feature: search for items by category

  As a web user
  So that I can find items using filter method
  I want to include and search on category information in items I enter

Background: movies in database

  Given the following items exist:
  | title        | category  | number  | neededItem | price |
  | iphone       | IT        | 1       | false      | 500   |
  | ipad         |           | 1       | false      | 1000  |
  | bed frame    | furniture | 1       | true       | 100   |
  | BMW          | vehicle   | 1       | false      | 40000 |

Scenario: add category to existing item
  When I go to the edit page for "ipad"
  And  I fill in "Category" with "IT"
  And  I press "Save Changes"
  Then the category of "ipad" should be "IT"

