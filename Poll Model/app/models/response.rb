class Response < ApplicationRecord
  # respondent
  belongs_to :respondent,
    class_name: "User",
    primary_key: :id,
    foreign_key: :user_id

# answer_choice
belongs_to :answer_choice,
  class_name: "AnswerChoice",
  primary_key: :id,
  foreign_key: :answer_choice_id

end
