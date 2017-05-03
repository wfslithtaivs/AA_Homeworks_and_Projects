class Add < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:tracks, :type, "Standard")
    change_column_default(:albums, :type, "Studio")
  end
end
