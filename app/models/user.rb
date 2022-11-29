class User < ActiveRecord::Base
  has_one :wishlist
  has_many :items
  has_many :comments
end