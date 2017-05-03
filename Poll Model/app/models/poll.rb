class Poll < ApplicationRecord

  # belongs to User::authored_polls
  belongs_to :author,
    class_name: "User",
    primary_key: :id,
    foreign_key: :author_id

  # questions
  has_many :questions,
    class_name: "Question",
    primary_key: :id,
    foreign_key: :poll_id


end
