class Item < ActiveRecord::Base
    has_many :wishlists
    has_many :comments
    belongs_to :user
    has_many_attached :images
    
    validates :title, :presence=> true
    validates :price, :presence=> true

    def Item.search_by_category(category)
        if category.nil?
            return []
        end
        return Item.where(category: category)
    end

    def Item.search(term)
      if term.nil?
        return []
      end
      return Item.where("lower(title) LIKE :search OR lower(category) LIKE :search OR lower(description) LIKE :search", search: "%#{term}%").uniq
    end

    def Item.search_by_user(user_id)
        return Item.where(user_id: user_id)
    end

    def Item.get_all_category()
        return ['Clothing', 'Shoes', 'Jewelry & Watches', 
            'Electronics', 'Home & Tools', 'Beauty & Health', 
            'Sports', 'Books', 'Pets', 'Grocery', 'Others']
    end
end
