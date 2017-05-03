class Post < ApplicationRecord
  validates :title, presence: true

  belongs_to :sub

  has_one :author

  has_many :comments,
  class_name: :Comment,
  primary_key: :id,
  foreign_key: :post_id
end
