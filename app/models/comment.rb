class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item

  def Comment.search_comments_by_item_id(item_id)
    puts item_id
    return Comment.where(item_id: item_id).order(created_at: :desc)
  end

  
end
