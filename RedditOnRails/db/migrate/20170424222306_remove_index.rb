class RemoveIndex < ActiveRecord::Migration[5.0]
  def change
    remove_index :comments, :column => :parent_comment_id
  end
end
