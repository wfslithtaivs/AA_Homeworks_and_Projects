class ChangeShortenedUrlColumnTypeAndNameVisits < ActiveRecord::Migration[5.0]
  def change
    add_column :visits, :shortened_url_id, :integer  
  end
end
