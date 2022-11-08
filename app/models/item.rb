class Item < ActiveRecord::Base
    has_many :wishlists
    belongs_to :user
    has_many_attached :images
    
    validates :title, :presence=> true
    validates :price, :presence=> true, :unless=>:neededItem

    def Item.search_by_category(category)
        if category.nil?
            return []
        end
        return Item.where(category: category)
    end


    def Item.search_by_user(user_id)
        return Item.where(user_id: user_id)
    end
end
