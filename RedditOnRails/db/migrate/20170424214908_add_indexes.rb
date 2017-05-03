class AddIndexes < ActiveRecord::Migration[5.0]
  def change
    add_index :comments, :parent_comment_id
  end
end
