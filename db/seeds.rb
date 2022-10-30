# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#



 users = [{:phone => '6462345569', :email => 'wangdazhuang@gmail.com', :password => '25-Nov-1992', :name => 'hanfushi'},
    { :phone => '6462345512', :email => 'wangdazhu@gmail.com', :password => '25-Nov-1992', :name => 'wuwei'},
    { :phone => '6362345569', :email => 'wangda@gmail.com', :password => '25-Nov-1992', :name => 'ziniu liu'},
 ]

 users.each do |user|
    User.create!(user)
  end

 movies.each do |movie|
    Movie.create!(movie)
  end