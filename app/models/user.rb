class User < ActiveRecord::Base
  has_one :wishlist
end