class CreateArtworkTable < ActiveRecord::Migration[5.0]
  def change
    create_table :artwork_tables do |t|
      t.string :title, null: false
      t.string :image_url, null: false
      t.integer :artist_id, null: false

      t.timestamps
    end
  end
end
