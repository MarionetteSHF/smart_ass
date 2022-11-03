Given /the following users exist/ do |users|
    users.hashes.each do |user|
      User.create user
    end
  end
  Then /I should see all the users/ do
    User.all.each do |user|
      step %{I should see "#{user.name}"}
    end
  end

Given /^I am an authenticated user$/ do
    name = 'abc'
    email = 'abc@gmail.com'
    phone = '123456'
    password = 'abcabc'

    Given %{I have one user "#{name}" with email "#{email}"and phone"#{phone}" and password "#{password}"}
    And %{I go to the user login page}
    And %{I fill in "email" with "#{email}"}
    And %{I fill in "password" with "#{password}"}
    And %{I press "Login"}
end
