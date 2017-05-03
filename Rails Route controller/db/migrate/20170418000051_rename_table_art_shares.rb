class RenameTableArtShares < ActiveRecord::Migration[5.0]
  def change
    add_index :artshares, :artwork_id
    add_index :artshares, :viewer_id
  end
end
