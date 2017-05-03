class CreateVisits < ActiveRecord::Migration[5.0]
  def change
    create_table :visits, :id => false do |t|
      t.integer :user_id
      t.string :shortened_url

      t.timestamps
    end

    add_index :visits, :user_id
    add_index :visits, :shortened_url
  end
end
