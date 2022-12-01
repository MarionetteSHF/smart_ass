# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

 items = [
   {:title => 'iphone', :description => 'a new one', :price => '900', :number=> 1, :category=>"IT", :user_id=>"1"},
   {:title => 'ipad', :description => 'a used one', :price => '500',  :number=> 1, :category=>"IT", :user_id=>"1"},
   {:title => 'bed', :description => 'a queen size bed', :price => '200',  :number=> 1, :category=>"furniture", :user_id=>"1"},
   {:title => 'desk', :description => 'a L shape one', :price => '100',  :number=> 1, :category=>"furniture", :user_id=>"1"},
   {:title => 'mouse', :description => 'a used mouse', :price => '20',  :number=> 1, :category=>"IT", :user_id=>"2"},
]
 users = [
    {:phone => '1234567777', :email => 'wangdazhuang@gmail.com', :password => 'testuser', :name => 'testuser', :description => 'test bio'},
    {:phone => '6462345569', :email => 'abc@gmail.com', :password => 'abcabc', :name => 'abc', :description => ''},
    {:phone => '6462345569', :email => 'wang@gmail.com', :password => 'wang', :name => 'hanfushi', :description => 'Columbia Biostats'},
    { :phone => '6462345512', :email => 'wuwei@gmail.com', :password => 'wuwei', :name => 'wuwei', :description => 'Columbia CS'},
    { :phone => '6362345569', :email => 'ziniu@gmail.com', :password => 'ziniu', :name => 'ziniu liu', :description => 'Columbia CS'},
 ]

 wishlists = [{:user_id => 1, :item_id => 1},
      {:user_id => 1, :item_id => 2},]

 users.each do |user|
    User.create!(user)
 end

  items.each do |item|
   Item.create!(item)
  end

  wishlists.each do |wishlist|
   Wishlist.create!(wishlist)
  end
