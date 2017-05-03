class Visit < ApplicationRecord
  validates :shortened_url_id, :presence => true
  validates :user_id, :presence => true

  def self.record_visit!(user, shortened_url)
    Visit.create!(user_id: user.id, shortened_url_id: shortened_url.id)
  end

  belongs_to :visitors,
    class_name: "User",
    primary_key: :id,
    foreign_key: :user_id

  belongs_to :visited_urls,
      class_name: "ShortenedUrl",
      primary_key: :id,
      foreign_key: :shortened_url_id
end
