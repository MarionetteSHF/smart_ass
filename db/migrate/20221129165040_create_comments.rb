class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
