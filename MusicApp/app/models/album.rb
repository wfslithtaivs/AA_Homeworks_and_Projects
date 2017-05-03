class Album < ApplicationRecord
  validates :title, :year, :band_id, :album_type, presence: true
  validates :album_type, inclusion: ["Studio", "Live"]

  has_many :tracks,
  dependent: :destroy,
  class_name: :Track,
  primary_key: :id,
  foreign_key: :album_id

  belongs_to :band,
  class_name: :Band,
  primary_key: :id,
  foreign_key: :band_id

end
