Feature: create and destroy items

  As a web user
  So that I can create and delete items

Background: items in database

  Given the following items exist:
  | title        | category  | number  | neededItem | price |
  | imac         |           | 1       | false      | 500   |
  | ipad         |           | 1       | false      | 1000  |
  | bed frame    | furniture | 1       | true       | 100   |
  | BMW          | vehicle   | 1       | false      | 40000 |
  | Audi         | vehicle   | 1       | false      | 45000 |

Scenario: delete a item
  When I go to the details page for "Audi"
  Then I press "Delete"
  Then I should see "Item 'Audi' has been deleted"
  And I should be on the items page

Scenario: create a item
  When I go to the new_item page
  Then I fill in "Title" with "Nike Sneakers"
  And I fill in "Description" with "A brand new sneakers."
  And I fill in "Category" with "shoes"
  And I fill in "Price" with "99"
  And I fill in "Number" with "1"
  And I press "Post"
  Then I should see "Nike Sneakers was successfully created"
  And I should be on the details page for "Nike Sneakers"

Scenario: Error on empty fields
  When I go to the new_item page
  And I fill in "Description" with "A brand new sneakers."
  And I fill in "Category" with "shoes"
  And I fill in "Price" with "99"
  And I fill in "Number" with "1"
  And I press "Post"
  Then I should see "please fill in all information"