class CreateWishlists < ActiveRecord::Migration[7.0]
    def up
      create_table :wishlists do |t|
        
        t.integer   :user_id
        t.integer   :item_id
        # Add fields that let Rails automatically keep track
        # of when movies are added or modified:
        # t.timestamps
      end
    end
  
    def down
      drop_table :users
    end
  end