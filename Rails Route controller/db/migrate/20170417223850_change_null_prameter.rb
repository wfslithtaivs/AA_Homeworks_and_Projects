class ChangeNullPrameter < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :username, :string, null: false
  end
end
