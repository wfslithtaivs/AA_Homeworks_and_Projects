class Artshare < ApplicationRecord
  validates :artwork_id, presence: true
  validates :viewer_id, presence: true

  validates_uniqueness_of :artwork_id, scope: :viewer_id

  belongs_to :viewer,
  class_name: :User,
  primary_key: :id,
  foreign_key: :viewer_id

  belongs_to :artwork,
  class_name: :Artwork,
  primary_key: :id,
  foreign_key: :artwork_id
end
