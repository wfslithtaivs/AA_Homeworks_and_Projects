class User < ActiveRecord::Base

  has_many :enrollments,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: "Enrollment"

  has_many :enrolled_courses,
    through: :enrollments,
    source: :course

  has_one :instructor,
    class_name: "User",
    primary_key: :id,
    foreign_key: :instructor_id
end
