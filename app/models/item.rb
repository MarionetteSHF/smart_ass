class Item < ActiveRecord::Base
    validates :title, :presence=> true
    validates :price, :presence=> true, :unless=>:neededItem
end
