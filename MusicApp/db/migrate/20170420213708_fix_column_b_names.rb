class FixColumnBNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :albums, :type, :album_type
    rename_column :tracks, :type, :track_type
  end
end
