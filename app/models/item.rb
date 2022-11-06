class Item < ActiveRecord::Base
    has_many :wishlists
    has_many :users
    
    validates :title, :presence=> true
    validates :price, :presence=> true, :unless=>:neededItem

    def Item.search_by_category(category)
        if category.nil?
            return []
        end
        return Item.where(category: category)
    end


    def Item.search_by_user(user_id)
        # not yet implemented
    end
end
