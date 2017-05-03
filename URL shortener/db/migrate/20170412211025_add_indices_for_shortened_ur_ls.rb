class AddIndicesForShortenedUrLs < ActiveRecord::Migration[5.0]
  def change
    add_index :shortened_urls, :short_url
    add_index :shortened_urls, :long_url
  end
end
