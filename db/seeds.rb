# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

 items = [{:title => 'iphone', :description => 'a new one', :price => '900', :neededItem=> false, :number=> 1, :category=>"IT"},
   {:title => 'ipad', :description => 'a used one', :price => '500', :neededItem=> false, :number=> 1, :category=>"IT"},
   {:title => 'bed', :description => 'a queen size bed', :price => '200', :neededItem=> false, :number=> 1, :category=>"furniture"},
   {:title => 'desk', :description => 'a L shape one', :price => '100', :neededItem=> false, :number=> 1, :category=>"furniture"},
]
 users = [{:phone => '6462345569', :email => 'wangdazhuang@gmail.com', :password => '25-Nov-1992', :name => 'hanfushi'},
    { :phone => '6462345512', :email => 'wangdazhu@gmail.com', :password => '25-Nov-1992', :name => 'wuwei'},
    { :phone => '6362345569', :email => 'wangda@gmail.com', :password => '25-Nov-1992', :name => 'ziniu liu'},
 ]

 users.each do |user|
    User.create!(user)
  end

  items.each do |item|
   Item.create!(item)
  end
