class RebuildSubsColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :subs, :title, :string
    add_column :subs, :description, :string
    add_column :posts, :sub_id, :string
  end
  remove_column :subs, :post_id
end
