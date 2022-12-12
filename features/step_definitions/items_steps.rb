
Given /the following items exist/ do |items|
    items.hashes.each do |item|
      Item.create item
    end
  end

Given /the following users registered/ do |users|
  users.hashes.each do |user|
    User.create user
  end
end

  
  Then /the category of "(.*)" should be "(.*)"/ do |item_title, category|
    expect(page).to have_content(item_title)
    expect(page).to have_content(category)
  end

When /I already logged in as user "(.*)"/ do |user_id|
  user = User.find_by_id user_id
  visit("/login")
  fill_in("Email Address", :with => user.email)
  fill_in("Password", :with=>user.password)
  click_button("Login")
end