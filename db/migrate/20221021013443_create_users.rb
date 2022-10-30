class CreateUsers < ActiveRecord::Migration[7.0]
    def up
      create_table :users do |t|
        
        t.string   :phone
        t.string   :name
        t.string   :email
        t.string :password
        # Add fields that let Rails automatically keep track
        # of when movies are added or modified:
        # t.timestamps
      end
    end
  
    def down
      drop_table :users
    end
  end