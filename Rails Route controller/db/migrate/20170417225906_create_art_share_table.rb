class CreateArtShareTable < ActiveRecord::Migration[5.0]
  def change
    create_table :art_share_tables do |t|
      t.integer :artwork_id, null: false
      t.integer :viewer_id, null: false
      t.timestamps
    end
  end
end
