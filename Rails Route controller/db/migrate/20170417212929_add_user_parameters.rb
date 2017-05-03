class AddUserParameters < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.string :name, null: false
      t.string :email
    end
  end
end
