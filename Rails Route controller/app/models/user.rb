class User < ApplicationRecord
  validates :username, presence: true
  validates :username, uniqueness: true

  has_many :artwork_shares,
  class_name: :User,
  primary_key: :id,
  foreign_key: :viewer_id

  has_many :shared_artworks,
  through: :artwork_shares,
  source: :artwork

  has_many :viewers,
  class_name: :User,
  primary_key: :id,
  foreign_key: :viewer_id
end
