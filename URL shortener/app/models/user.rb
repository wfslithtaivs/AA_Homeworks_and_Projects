class User < ActiveRecord::Base

  validates :email, :uniqueness => true
  validates :email, :presence => true

  has_many :submissions,
    through: :submitted_urls,
    source: :visited_urls

  has_many :visited_urls,
    class_name: "Visit",
    primary_key: :id,
    foreign_key: :user_id

end
