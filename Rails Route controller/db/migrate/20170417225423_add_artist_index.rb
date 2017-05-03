class AddArtistIndex < ActiveRecord::Migration[5.0]
  def change
    add_index :artworks, :artist_id
  end
end
