class Course < ApplicationRecord
  has_many :users,
  class_name: :User,
  foreign_key: :student_id,
  primary_key: :id

  belongs_to :instructor,
  class_name: :User,
  foreign_key: :instructor_id,
  primary_key: :id

  belongs_to :prerequisite,
  class_name: :Course,
  foreign_key: :prereq_id,
  primary_key: :id 
end
