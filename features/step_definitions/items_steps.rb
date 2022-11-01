
Given /the following items exist/ do |items|
    items.hashes.each do |item|
      Item.create item
    end
  end
  

  
  Then /the category of "(.*)" should be "(.*)"/ do |item_title, category|
    expect(page).to have_content(item_title)
    expect(page).to have_content(category)
  end