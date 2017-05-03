class Comment < ApplicationRecord
  validates :content, presence: true

  belongs_to :parent_comment,
  class_name: :Comment,
  primary_key: :id,
  foreign_key: :parent_comment_id, optional: true

  has_many :child_comments,
  class_name: :Comment,
  primary_key: :id,
  foreign_key: :parent_comment_id

  has_one :author,
  class_name: :User,
  primary_key: :id,
  foreign_key: :author_id

  has_one :post,
  class_name: :Post,
  primary_key: :id,
  foreign_key: :post_id
end
