class CreateUsers < ActiveRecord::Migration[7.0]
    def up
      create_table :users do |t|
        t.string   :user_id
        t.string   :phone
        t.string   :name
        t.string   :email
        t.string :encrypted_password
        # Add fields that let Rails automatically keep track
        # of when movies are added or modified:
        # t.timestamps
      end
    end
  
    def down
      drop_table :users
    end
  end