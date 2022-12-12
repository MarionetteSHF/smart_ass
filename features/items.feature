Feature: create and destroy items

  As a web user, I can create and delete items,
  add items to the wishlist, and remove items from wishlist

Background: items in database

  Given the following users registered:
  | phone      | name | email            | password |
  | 4123893748 | Wu   | wuw1998@sina.com | 123456   |
  | 4123893788 | Qi   | qi1998@sina.com  | 123456   |

  Given the following items exist:
  | title        | category     | number  | price | user_id |
  | iphone       | Electronics  | 1       | 999   | 1       |
  | ipad         | Electronics  | 1       | 1099  | 2       |
  | bed frame    | Home & Tools | 1       | 100   | 1       |
  | Monitor      | Electronics  | 1       | 150   | 1       |
  | Basketball   | Sports       | 1       | 20    | 1       |

Scenario: login before view item detail
  When I go to the details page for "Basketball"
  And I should be on the login page

Scenario: login before post new item
  When I go to the new_item page
  And I should be on the login page

Scenario: could not delete others' items
  When I already logged in as user "1"
  And I go to the details page for "ipad"
  Then I should not see "Delete"

Scenario: delete an item
  When I already logged in as user "1"
  And I go to the details page for "Basketball"
  Then I press "Delete"
  Then I should see "Item 'Basketball' has been deleted"
  And I should be on the items page

Scenario: create an item
  When I already logged in as user "1"
  Then I go to the new_item page
  Then I fill in "Title" with "Nike Sneakers"
  And I fill in "Description" with "A brand new sneakers."
  And I select "Shoes" from "Category"
  And I fill in "Price" with "99"
  And I fill in "Number" with "1"
  And I press "Post"
  Then I should see "Nike Sneakers was successfully created"
  And I should be on the details page for "Nike Sneakers"
  And I go to the myitems page
  Then I should see "Nike Sneakers"

Scenario: Error on empty fields
  When I already logged in as user "1"
  Then I go to the new_item page
  And I fill in "Description" with "A brand new sneakers."
  And I select "Shoes" from "Category"
  And I fill in "Price" with "99"
  And I fill in "Number" with "1"
  And I press "Post"
  Then I should see "Title can't be blank"

Scenario: add an item to wishlist and delete it
  When I already logged in as user "2"
  And I go to the details page for "Monitor"
  Then I follow "Add to Wishlist"
  Then I should see "Monitor was successfully added to your wishlist"
  And I should be on the wishlists page
  And I should see "Monitor"
  And I go to the details page for "Monitor"
  Then I press "Remove from Wishlist"
  Then I should see "Monitor was removed from wishlist"
  And I should be on the wishlists page
  And I go to the wishlists page
  And I should not see "Monitor"

Scenario: can not add their own items to the wishlist
  When I already logged in as user "1"
  And I go to the details page for "Monitor"
  Then I should not see "Add to Wishlist"

Scenario: seach item's name
  When I already logged in as user "1"
  And I go to the details page for "bed frame"
  And I fill in "search_term_" with "ipad"
  And I press "button"
  Then I should see "ipad"

Scenario: seach item's category
  When I already logged in as user "1"
  And I go to the details page for "bed frame"
  And I fill in "search_term_" with "Electronics"
  And I press "button"
  Then I should see "ipad"

Scenario: leave comment
  When I already logged in as user "1"
  And I go to the details page for "iphone"
  And I fill in "description" with "Nice iPhone!"
  And I press "Post"
  Then I should see "Comment added"
  And I should see "Nice iPhone!"

Scenario: can not leave empty comment
  When I already logged in as user "1"
  And I go to the details page for "iphone"
  And I press "Post"
  Then I should see "Comment can not be empty!"

Scenario: can not leave a comment consisting only of spaces
  When I already logged in as user "1"
  And I go to the details page for "iphone"
  And I fill in "description" with "         "
  And I press "Post"
  Then I should see "Comment can not be empty!"