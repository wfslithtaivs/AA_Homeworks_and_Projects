class Artwork < ApplicationRecord
  validates :title, presence: true
  validates :image_url, presence: true
  validates :artist_id, presence: true

  validates_uniqueness_of :title, scope: :artist_id

  belongs_to :artist,
  class_name: :User,
  primary_key: :id,
  foreign_key: :artist_id

  has_many :shared_viewers,
  through: :artist,
  source: :viewers

  has_many :artworks,
  class_name: :Artwork,
  primary_key: :id,
  foreign_key: :artwork_id
end
