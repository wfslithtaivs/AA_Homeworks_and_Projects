class DropDuplicatedLogic < ActiveRecord::Migration[5.0]
  def change
     drop_table :artwork_tables
  end
end
