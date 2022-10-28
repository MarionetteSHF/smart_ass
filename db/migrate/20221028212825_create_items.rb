class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.float :price
      t.integer :number
      t.boolean :neededItem
      t.string :category

      t.timestamps
    end
  end
end
