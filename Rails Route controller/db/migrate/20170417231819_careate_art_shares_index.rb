class CareateArtSharesIndex < ActiveRecord::Migration[5.0]
  def change
    rename_table :art_share_tables, :artshares
  end
end
