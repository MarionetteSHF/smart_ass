Feature: create and destroy items

  As a web user
  So that I can create and delete items

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

Scenario: login before view item detail
  When I go to the details page for "Audi"
  And I should be on the login page

Scenario: login before post new item
  When I go to the new_item page
  And I should be on the login page

Scenario: could not delete others' items
  When I already logged in as user "1"
  And I go to the items page
  Then I should not see "Delete"

Scenario: delete a item
  When I already logged in as user "1"
  And I go to the details page for "Audi"
  Then I press "Delete"
  Then I should see "Item 'Audi' has been deleted"
  And I should be on the items page

Scenario: create a item
  When I already logged in as user "1"
  Then I go to the new_item page
  Then I fill in "Title" with "Nike Sneakers"
  And I fill in "Description" with "A brand new sneakers."
  And I fill in "Category" with "shoes"
  And I fill in "Price" with "99"
  And I fill in "Number" with "1"
  And I press "Post"
  Then I should see "Nike Sneakers was successfully created"
  And I should be on the details page for "Nike Sneakers"

Scenario: Error on empty fields
  When I already logged in as user "1"
  Then I go to the new_item page
  And I fill in "Description" with "A brand new sneakers."
  And I fill in "Category" with "shoes"
  And I fill in "Price" with "99"
  And I fill in "Number" with "1"
  And I press "Post"
  Then I should see "Title can't be blank"

Scenario: add a item to wishlist and delete it
  When I already logged in as user "2"
  And I go to the details page for "BMW"
  Then I follow "Add to Wishlist"
  Then I should see "BMW was successfully added to your wishlist"
  And I should be on the wishlists page
  And I should see "BMW"
  And I go to the details page for "BMW"
  Then I press "Remove from Wishlist"
  Then I should see "BMW was removed from wishlist"
  And I should be on the wishlists page
  And I go to the wishlists page
  And I should not see "BMW"