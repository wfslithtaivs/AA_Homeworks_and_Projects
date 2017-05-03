class Enrollment < ActiveRecord::Base
  validates :course_id, presence: true
  validates :student_id, presence: true

  belongs_to :course,
    class_name: "Course",
    primary_key: :id,
    foreign_key: :course_id

  belongs_to :student,
    class_name: "User",
    primary_key: :id,
    foreign_key: :student_id
end
