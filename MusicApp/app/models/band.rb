class Band < ApplicationRecord
  validates :name, presence: true

  has_many :albums,
  dependent: :destroy,
  class_name: :Album,
  primary_key: :id,
  foreign_key: :band_id

  has_many :tracks,
  class_name: :Track,
  through: :albums,
  source: :tracks
end
