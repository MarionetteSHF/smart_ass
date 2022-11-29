class RemoveNeededItemFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :neededItem, :boolean
  end
end
